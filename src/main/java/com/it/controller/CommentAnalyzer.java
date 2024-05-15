package com.it.controller;

import org.apache.commons.text.similarity.JaccardSimilarity;
import org.apache.commons.text.similarity.LevenshteinDistance;
import weka.classifiers.bayes.NaiveBayes;
import weka.core.Attribute;
import weka.core.DenseInstance;
import weka.core.Instances;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/**
 * @Author HE LONG CAN
 * @Description 基于朴素贝叶斯分类器
 * @Date 2023-03-24 20:08:47
 */
public class CommentAnalyzer {
    private NaiveBayes classifier;
    private List<String> praiseKeywords = Arrays.asList("好", "太棒", "赞");


    public CommentAnalyzer() throws Exception {
        // 创建朴素贝叶斯分类器
        classifier = new NaiveBayes();

        // 准备训练数据
        Instances data = new Instances("comment_data",
                (ArrayList<Attribute>) createAttributes(),
                0);
        data.setClassIndex(2);
        data.add(new DenseInstance(1.0,
                new double[] { 1, 0.1, 1 }));
        data.add(new DenseInstance(1.0,
                new double[] { 0.2, 1, 0 }));

        // 训练分类器
        classifier.buildClassifier(data);
    }

    public boolean analyze(String comment) throws Exception {
        // 计算评论与赞扬关键字的相似度
        double similarity = calculateSimilarity(comment);

        // 使用朴素贝叶斯分类器预测是否有夸赞的意思
        Instances instance = new Instances("comment_instance",
                (ArrayList<Attribute>) createAttributes(),
                0);
        instance.setClassIndex(2);
        instance.add(new DenseInstance(1.0,
                new double[] { 1, similarity, 0 }));
        double prediction = classifier.classifyInstance(instance.firstInstance());

        return prediction == 1.0;
    }

    private List<Attribute> createAttributes() {
        Attribute similarity = new Attribute("similarity");
        Attribute isPraise = new Attribute("isPraise",
                Arrays.asList("false", "true"));
        Attribute classAttribute = new Attribute("classAttribute",
                Arrays.asList("negative", "positive"));
        ArrayList<Attribute> list = new ArrayList<>();
        list.add(similarity);
        list.add(isPraise);
        list.add(classAttribute);
        return list;
    }

    private double calculateSimilarity(String comment) {
        // 计算评论与赞扬关键字的相似度
        JaccardSimilarity jaccardSimilarity = new JaccardSimilarity();
        LevenshteinDistance levenshteinDistance = new LevenshteinDistance();
        double similarity = 0;
        for (String keyword : praiseKeywords) {
            double jaccardScore = jaccardSimilarity.apply(keyword, comment);
            double levenshteinScore = 1 - (double)levenshteinDistance.apply(keyword, comment) / Math.max(keyword.length(), comment.length());
            similarity += (jaccardScore + levenshteinScore) / 2;
        }
        similarity /= praiseKeywords.size();

        if (similarity > 0.38) {
            praiseKeywords.add(comment);
        }
        return similarity;
    }
}

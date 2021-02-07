package com.gqchen.service.impl;

import com.gqchen.controller.IndexUserController;
import com.gqchen.service.MailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.gqchen.entity.MailProperties;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * @program: Online
 * @description: 发送邮件实现类
 * @author: GuiQingChen
 * @create: 2021-02-07 16:27
 **/
@Service
public class MailServiceImpl implements MailService {

    private final static Logger LOG = LoggerFactory.getLogger(MailServiceImpl.class);

    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private MailProperties mailProperties;

    @Override
    public boolean sendSimpleMail(String to, String subject, String text) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();

        mailProperties.setTo(to);

        mailMessage.setFrom(mailProperties.getFrom());
        mailMessage.setTo(mailProperties.getTo());

        mailMessage.setSubject(subject);
        mailMessage.setText(text);
        try {
            javaMailSender.send(mailMessage);
            return true;
        } catch (Exception e) {
            return false;
        }

    }
}

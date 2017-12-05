from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import time
from datetime import datetime
from moduleGlobal import app


db = SQLAlchemy(app)


# POST

class PostComment(db.Model):
    __tablename__ = 'post_comment'
    id = db.Column(db.Integer, primary_key=True)
    created_at = db.Column(db.DateTime, default=datetime.now())
    updated_at = db.Column(db.DateTime, default=datetime.now())
    content = db.Column(db.String(8000))
    status = db.Column(db.String(80))
    comment_id = db.Column(db.Integer)
    form = db.Column(db.String(80))
    agree = db.Column(db.Integer, default=0)
    disagree = db.Column(db.Integer, default=0)
    post_id = db.Column(db.Integer, db.ForeignKey('post.id'))
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))

    def __repr__(self):
        return '<PostComment %r>' % self.name


class PostTagMid(db.Model):
    __tablename__ = 'post_tag_mid'
    id = db.Column(db.Integer, primary_key=True)
    post_id = db.Column(db.Integer, db.ForeignKey('post.id'))
    tag_id = db.Column(db.Integer, db.ForeignKey('post_tag.id'))


class PostTag(db.Model):
    __tablename__ = 'post_tag'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    def __repr__(self):
        return '<PostTag %r>' % self.name


class PostFieldMid(db.Model):
    __tablename__ = 'post_field_mid'
    id = db.Column(db.Integer, primary_key=True)
    post_id = db.Column(db.Integer, db.ForeignKey('post.id'))
    field_id = db.Column(db.Integer, db.ForeignKey('field.id'))


class Post(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    created_at = db.Column(db.DateTime, default=datetime.now())
    updated_at = db.Column(db.DateTime, default=datetime.now())
    content = db.Column(db.String(8000))
    status = db.Column(db.String(80))
    img = db.Column(db.String(200))
    view_count = db.Column(db.Integer, default=0)
    agree = db.Column(db.Integer, default=0)
    disagree = db.Column(db.Integer, default=0)
    comments = db.relationship('PostComment', backref='Post', lazy='dynamic')
    tags = db.relationship('PostTag', secondary="post_tag_mid", backref='posts', lazy='dynamic')
    fields = db.relationship('Field', secondary="post_field_mid", backref='posts', lazy='dynamic')
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))

    def __repr__(self):
        return '<Post %r>' % self.name


# PROJECT

class ProjectComment(db.Model):
    __tablename__ = 'project_comment'
    id = db.Column(db.Integer, primary_key=True)
    created_at = db.Column(db.DateTime, default=datetime.now())
    updated_at = db.Column(db.DateTime, default=datetime.now())
    content = db.Column(db.String(8000))
    status = db.Column(db.String(80))
    comment_id = db.Column(db.Integer)
    form = db.Column(db.String(80))
    agree = db.Column(db.Integer, default=0)
    disagree = db.Column(db.Integer, default=0)
    project_id = db.Column(db.Integer, db.ForeignKey('project.id'))
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))

    def __repr__(self):
        return '<ProjectComment %r>' % self.name


class ProjectTagMid(db.Model):
    __tablename__ = 'project_tag_mid'
    id = db.Column(db.Integer, primary_key=True)
    project_id = db.Column(db.Integer, db.ForeignKey('project.id'))
    tag_id = db.Column(db.Integer, db.ForeignKey('project_tag.id'))


class ProjectTag(db.Model):
    __tablename__ = 'project_tag'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))

    def __repr__(self):
        return '<ProjectTag %r>' % self.name


class ProjectFieldMid(db.Model):
    __tablename__ = 'project_field_mid'
    id = db.Column(db.Integer, primary_key=True)
    project_id = db.Column(db.Integer, db.ForeignKey('project.id'))
    field_id = db.Column(db.Integer, db.ForeignKey('field.id'))


class Project(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    created_at = db.Column(db.DateTime, default=datetime.now())
    updated_at = db.Column(db.DateTime, default=datetime.now())
    content = db.Column(db.String(8000))
    status = db.Column(db.String(80))
    img = db.Column(db.String(200))
    view_count = db.Column(db.Integer, default=0)
    agree = db.Column(db.Integer, default=0)
    disagree = db.Column(db.Integer, default=0)
    comments_id = db.relationship('ProjectComment', backref='Project', lazy='dynamic')
    tags = db.relationship('ProjectTag', secondary="project_tag_mid", backref='Project', lazy='dynamic')
    fields = db.relationship('Field', secondary="project_field_mid", backref='Project', lazy='dynamic')
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))

    def __repr__(self):
        return '<Project %r>' % self.name


# QUESTION

class QuestionComment(db.Model):
    __tablename__ = 'question_comment'
    id = db.Column(db.Integer, primary_key=True)
    created_at = db.Column(db.DateTime, default=datetime.now())
    updated_at = db.Column(db.DateTime, default=datetime.now())
    content = db.Column(db.String(8000))
    status = db.Column(db.String(80))
    comment_id = db.Column(db.Integer)
    form = db.Column(db.String(80))
    agree = db.Column(db.Integer, default=0)
    disagree = db.Column(db.Integer, default=0)
    question_id = db.Column(db.Integer, db.ForeignKey('question.id'))
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))

    def __repr__(self):
        return '<QuestionComment %r>' % self.name


class QuestionTagMid(db.Model):
    __tablename__ = 'question_tag_mid'
    id = db.Column(db.Integer, primary_key=True)
    question_id = db.Column(db.Integer, db.ForeignKey('question.id'))
    tag_id = db.Column(db.Integer, db.ForeignKey('question_tag.id'))


class QuestionTag(db.Model):
    __tablename__ = 'question_tag'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))

    def __repr__(self):
        return '<QuestionTag %r>' % self.name


class QuestionFieldMid(db.Model):
    __tablename__ = 'question_field_mid'
    id = db.Column(db.Integer, primary_key=True)
    question_id = db.Column(db.Integer, db.ForeignKey('question.id'))
    field_id = db.Column(db.Integer, db.ForeignKey('field.id'))


class Question(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    created_at = db.Column(db.DateTime, default=datetime.now())
    updated_at = db.Column(db.DateTime, default=datetime.now())
    content = db.Column(db.String(8000))
    status = db.Column(db.String(80))
    img = db.Column(db.String(200))
    view_count = db.Column(db.Integer, default=0)
    agree = db.Column(db.Integer, default=0)
    disagree = db.Column(db.Integer, default=0)
    comments = db.relationship('QuestionComment', backref='Question', lazy='dynamic')
    tags = db.relationship('QuestionTag', secondary="question_tag_mid", backref='Question', lazy='dynamic')
    fields = db.relationship('Field', secondary="question_field_mid", backref='Question', lazy='dynamic')
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))

    def __repr__(self):
        return '<Project %r>' % self.name

# MSGS
class Message(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.String(2000))
    from_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    to_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    created_at = db.Column(db.DateTime, default=datetime.now())
    def __repr__(self):
        return '<Message %r>' % self.name

class Notification(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.String(2000))
    created_at = db.Column(db.DateTime, default=datetime.now())

    def __repr__(self):
        return '<Field %r>' % self.name

class NotificationUserMid(db.Model):
    __tablename__ = 'notification_user_mid'
    id = db.Column(db.Integer, primary_key=True)
    notification_id = db.Column(db.Integer, db.ForeignKey('notification.id'))
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    status = db.Column(db.String(80))
# USER
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80),unique=True)
    email = db.Column(db.String(80),unique=True)
    auth = db.Column(db.Integer)
    avartar = db.Column(db.String(120))
    password = db.Column(db.String(120))
    created_at = db.Column(db.DateTime, default=datetime.now())
    work_id = db.Column(db.String(120))
    mobile = db.Column(db.String(120),unique=True)
    content = db.Column(db.String(120))
    level_id = db.Column(db.Integer, db.ForeignKey('user_level.id'))
    prestige_id = db.Column(db.Integer, db.ForeignKey('user_prestige.id'))
    v_id = db.Column(db.Integer, db.ForeignKey('user_v.id'))
    level = db.relationship('UserLevel')
    prestige = db.relationship('UserPrestige')
    v = db.relationship('UserV')
    posts = db.relationship('Post', backref='User', lazy='dynamic')
    post_comments = db.relationship('PostComment', backref='User', lazy='dynamic')
    projects = db.relationship('Project', backref='User', lazy='dynamic')
    project_comments = db.relationship('ProjectComment', backref='User', lazy='dynamic')
    questions = db.relationship('Question', backref='User', lazy='dynamic')
    question_comments = db.relationship('QuestionComment', backref='User', lazy='dynamic')
    degree_id = db.Column(db.Integer, db.ForeignKey('user_degree.id'))
    major_id = db.Column(db.Integer, db.ForeignKey('user_major.id'))
    degree = db.relationship('UserMajor')
    major = db.relationship('UserDegree')
    sended_msgs = db.relationship('Message', backref='from',  lazy='dynamic',foreign_keys=Message.from_id)
    recived_msgs = db.relationship('Message', backref='to', lazy='dynamic',foreign_keys=Message.to_id)
    recived_notifications = db.relationship('Notification', secondary="notification_user_mid",backref='User', lazy='dynamic')
    # def __init__(self,username=None,email=None, password=None,work_id=None,avartar=None,mobile=None,major_id=None,degree_id=None):
    #     self.username = username
    #     self.email = email
    #     self.password = hash_password(password)
    #     self.work_id = work_id
    #     self.avartar = avartar
    #     self.mobile = mobile
    #     self.major_id = major_id
    #     self.degree_id = degree_id



    def __repr__(self):
        return '<User %r>' % self.username

class UserMajor(db.Model):
    __tablename__ = 'user_major'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    users = db.relationship('User', backref='UserMajor', lazy='dynamic')
class UserDegree(db.Model):
    __tablename__ = 'user_degree'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    users = db.relationship('User', backref='UserDegree', lazy='dynamic')
class UserLevel(db.Model):
    __tablename__ = 'user_level'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    users = db.relationship('User', backref='UserLevel', lazy='dynamic')

    def __repr__(self):
        return '<UserLevel %r>' % self.name


class UserPrestige(db.Model):
    __tablename__ = 'user_prestige'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    users = db.relationship('User', backref='UserPrestige', lazy='dynamic')

    def __repr__(self):
        return '<UserPrestige %r>' % self.name


class UserV(db.Model):
    __tablename__ = 'user_v'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    users = db.relationship('User', backref='UserV', lazy='dynamic')

    def __repr__(self):
        return '<UserV %r>' % self.name


# db
class Field(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))

    def __repr__(self):
        return '<Field %r>' % self.name


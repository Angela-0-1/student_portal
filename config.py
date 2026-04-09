import os

class Config:
    SQLALCHEMY_DATABASE_URI = 'postgresql://postgres:passwordbutterfly/student_portal'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
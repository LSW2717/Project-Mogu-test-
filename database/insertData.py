import mysql.connector
from faker import Faker
import random
from datetime import datetime

# Faker 인스턴스 생성
fake = Faker("ko_KR")

# MySQL 데이터베이스 연결 설정
conn = mysql.connector.connect(
    host="localhost", user="root", passwd="tldnjs0807", database="mogu_web"
)
cursor = conn.cursor()

# 대회 분류 샘플 데이터
categories = ["해커톤", "디자인", "코딩", "미술"]

for _ in range(100):
    name = f"{fake.word().capitalize()} 대회"
    category = random.choice(categories)
    # 현재 날짜 이후의 날짜 생성
    end_date = fake.date_between(start_date="today", end_date="+5y")
    url = fake.url()

    query = (
        "INSERT INTO contest (name, category, end_date, url) VALUES (%s, %s, %s, %s)"
    )
    values = (name, category, end_date, url)

    cursor.execute(query, values)

conn.commit()

cursor.close()
conn.close()

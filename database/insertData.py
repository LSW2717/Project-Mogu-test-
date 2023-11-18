import mysql.connector
from faker import Faker
import random

# Faker 인스턴스 생성
fake = Faker("ko_KR")

# MySQL 데이터베이스 연결 설정
conn = mysql.connector.connect(
    host="localhost", user="root", passwd="tldnjs0807", database="moguTest"
)
cursor = conn.cursor()

# 대회 분류 샘플 데이터
categories = ['해커톤', '디자인', '코딩', '미술']

for _ in range(10000):
    name = f"{fake.word().capitalize()} 대회"
    category = random.choice(categories)
    end_date = fake.date()
    url = fake.url()

    query = (
        "INSERT INTO contest (name, category, end_date, url) VALUES (%s, %s, %s, %s)"
    )
    values = (name, category, end_date, url)

    cursor.execute(query, values)

conn.commit()

cursor.close()
conn.close()

-- 2020.10.30(금)까지 숙제
-- 1번
-- 학과 이름과 계열을 표시하시오. 
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT;

-- 2번
-- 학과의 학과 정원을 다음과 같은형태로 화면에 출력한다
SELECT DEPARTMENT_NAME || '의 정원은' || CAPACITY || '명 입니다.' AS "학과별 정원"
FROM TB_DEPARTMENT;

-- 3번
-- 국어국문 휴학중인 여학생 
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE ABSENCE_YN LIKE 'Y'
AND DEPARTMENT_NO LIKE '001'
AND STUDENT_SSN LIKE '_______2%';

-- 4번
-- 학번 A513079, A513090, A513091, A513110, A513119
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079','A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NAME DESC;

-- 5번
-- 입학정원이 20명 이상 30명 이하인 학과들의 학과 이름과 계열을 출력하시오
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30; 

-- 6번
-- 총장의 이름 
SELECT PROFESSOR_NAME -- 보여질 것. 교수 이름 
FROM TB_PROFESSOR -- 교수 테이블 안에서 
WHERE DEPARTMENT_NO IS NULL; -- 학과 번호가 없는 사람 

-- 7번
-- 학과가 없는 학생 (학과없는 사람이 없어서 안뜨는 게 정상)
SELECT DEPARTMENT_NAME 
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NO IS NULL; 

-- 8번
-- 선수과목이 존재하는 과목들은 어떤 과목인지 과목번호 조회 
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 9번
-- 어떤 계열(CATEGORY)들이 있는지 조회 // 중복 제거 
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT; 

-- 10번
-- 02학번 전주 거주자들의 모임, 
-- 휴학한 사람들은 제외한 재학중인 학생들의 학번, 이름, 주민번호 출력
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN LIKE 'N'
AND ENTRANCE_DATE LIKE '02%'
AND STUDENT_ADDRESS LIKE '%전주%' ;



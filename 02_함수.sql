-- 2020.10.30(금) 
-- 함수 : 컬럼의 값을 읽어서 계산한 결과를 리턴
/*
  - 단일행 함수(SINGLE ROW)
    컬럼에 기록된 N개의 값을 읽어서 N개의 결과를 리턴하는 함수 
    
  - 그룹 함수(GROUP)  
    컬럼에 기록된 N개의 값을 읽어서 1개의 결과를 리턴하는 함수 
    
    (주의사항)
    - 단일 행 함수와 그룹 함수는 같이 사용할 수 없음
       --> 결과 행의 수가 다르기 때문에 ... 
    
    - 함수를 사용할 수 있는 위치
      -- SELECT절, WHERE절, ORDER BY절
      -- GROUP BY절, HAVING절
*/

-------------------------------------------------------------------

-- 단일 행 함수

-- 1. 문자 관련 함수

-- 1) LENGTH / LENGTHB
-- LENGTH : 주어진 컬럼 데이터의 길이
-- LENGTHB : 주어진 컬럼 데이터의 BYTE 크기

-- EMPLOYEE 테이블에서 직원명, 이메일, 이메일 길이 조회 
SELECT EMP_NAME, EMAIL, LENGTH(EMAIL)
FROM EMPLOYEE;

SELECT LENGTH('오라클') FROM DUAL; 
-- DUAL(DUMMY TABLE) : 가상 테이블 

SELECT LENGTH('ORACLE'), LENGTHB('ORACLE123') FROM DUAL;

SELECT LENGTHB('오라클') FROM DUAL; 

-- ORACLE EXPREE EDITION(XE버전): 교육용 무료 버전
-- 영어, 숫자 1바이트
-- 한글, 다른 나라 외국어, 특수문자 등 아스키코드 이외의 문자 : 3바이트 
-- -> 컬럼의 데이터 타입을 NVARCHAR2를 사용 (유니코드 문자 사용)

-------------------------------------------------------------

-- 2) INSTR
-- 지정한 위치부터 지정한 숫자 번째로 나타나는 문자의 시작 위치 반환 
-- [작성법]
-- INSTR('문자열'|컬럼명,  '문자'  [, 검색 시작 인덱스 [, 순번]] );

-- 첫 번째 문자(1)부터 검색하여 'B'가 처음 나오는 위치 조회 
SELECT INSTR('AABAACBBAA', 'B') FROM DUAL;
--> 오라클은 인덱스가 1부터 시작 

SELECT INSTR('AABAACBBAA', 'B', 1, 1) FROM DUAL;

-- 첫 번째 문자(1)부터 검색하여 'B'가 처음 나오는 위치 조회 
SELECT INSTR('AABAACBBAA', 'B', 1, 2) FROM DUAL;

-- 마지막 문자(-1) 부터 검색하여 'B'가 처음 나오는 위치 조회
SELECT INSTR('AABAACBBAA', 'B', -1, 1) FROM DUAL;

-- EMPLOYEE 테이블에서 
-- 사원명, 이메일, 이메일에서 '@'의 위치 조회
SELECT EMP_NAME, EMAIL, INSTR(EMAIL, '@', 1, 1)
FROM EMPLOYEE;

------------------------------------------------------------------

-- 3) TRIM 
-- 주어진 문자열 또는 컬럼 값의 앞/뒤/양쪽/에 있는 지정한 문자를 제거
-- 지정한 문자가 없는 경우 공백을 제거함. 
SELECT '     KH     ' FROM DUAL;
SELECT TRIM('     KH     ') FROM DUAL;

-- 양쪽 제거(BOTH, 기본값)
SELECT TRIM('-' FROM '-----KH-----') FROM DUAL;
SELECT TRIM(BOTH '-' FROM '-----KH-----') FROM DUAL; 

-- 왼쪽 제거(LEADING, LTRIM)
SELECT TRIM(LEADING '-' FROM '-----KH-----') FROM DUAL; 
SELECT LTRIM('-----KH-----', '-') FROM DUAL;

-- 오른쪽 제거(TRAILING, RTRIM)
SELECT TRIM(TRAILING '-' FROM '-----KH-----') FROM DUAL;
SELECT RTRIM('-----KH-----', '-') FROM DUAL;

---------------------------------------------------------

/* 4) SUBSTR
  - 컬럼 값이나 문자열에서 지정한 위치부터 지정한 개수의 문자를 잘라내어 반환하는 함수
  
  - [작성법]
    SUBSTR(컬럼명 | '문자열', POSITION[, LENGTH] )
    POSITION : 잘라내기 시작할 위치
    LENGTH : 잘라낼 길이 
*/

SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;

-- 7번부터 끝까지 잘라내어 반환
SELECT SUBSTR('SHOWMETHEMONEY',7) FROM DUAL;

SELECT SUBSTR('SHOWMETHEMONEY',1, 6) FROM DUAL;

- 끝에서 부터 8번쨰부터 잘라내기 시작해서 3글자 자르기
SELECT SUBSTR('SHOWMETHEMONEY',-8, 3) FROM DUAL;

-- EMPLOYEE 테이블에서
-- 사원명, 이메일, 이메일 아이디 조회
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1)
FROM EMPLOYEE;

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, INSTR(EMP_NO,'-')+1, 1)"성별 부분"
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서
-- 성별이 남성인 사원의 
-- 사원명, 주민등록번호, 주민등록번호 중 성별 부분 조회

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) "성별 부분"
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1)='1';

-- EMPLOYEE 테이블에서
-- 사원명, 태어난 년, 월, 일을 조회
SELECT EMP_NAME, SUBSTR(EMP_NO, 1, 2) "년" 
,SUBSTR(EMP_NO, 3, 2) "월"
,SUBSTR(EMP_NO, 5, 2) "일"
FROM EMPLOYEE; 

SELECT EMP_NAME,
  SUBSTR(EMP_NO, 1, 2) || '년' AS 년,
  SUBSTR(EMP_NO, 3, 2) || '월' AS 월,
  SUBSTR(EMP_NO, 5, 2) || '일' AS 일
FROM EMPLOYEE; 

---------------------------------------------------------------

-- 5) LPAD / RPAD 
-- 주어진 컬럼값이나 문자열에 임의의 문자열을 좌/우에 덧붙여서 길이 N인 문자열을 반환
-- [작성법]
-- LPAD|RPAD (컬럼명 | '문자열', 반환할 문자열의 길이(N), [, 공백에 덧붙일 문자])

-- 20칸을 할당하고 데이터를 오른쪽 정렬 후 왼쪽 공백에 빈칸을 덧붙임. 
SELECT LPAD(EMAIL, 20) FROM EMPLOYEE; 

-- 20칸을 할당하고 데이터를 오른쪽 정렬 후 왼쪽 공백에 '#'을 덧붙임. 
SELECT LPAD(EMAIL, 20, '#') FROM EMPLOYEE;

-- 20칸을 할당하고 데이터를 왼쪽 정렬 후 오른쪽 공백에 '#'을 덧붙임. 
SELECT RPAD(EMAIL, 20, '#') FROM EMPLOYEE;

-- EMPLOYEE 테이블에서
-- 사원명, 주민등록번호를 조회
-- 단, 주민등록번호 뒷자리는 성별 보이고 나머지는 '*'로 처리
-- 901030-1******
SELECT EMP_NAME,RPAD(SUBSTR(EMP_NO, 1, 8) , 14, '*')
FROM EMPLOYEE;

-------------------------------------------------------------------

-- 6) REPLACE
-- 컬럼값 또는 문자열에서 특정 문자열을 지정한 문자열로 변경 후 반환 
-- [작성법]
-- REPLACE(컬럼명 | '문자열', 변경하려는 문자열, 변경하고자 하는 문자열)
SELECT REPLACE('서울시 강남구 역삼동', '역삼동', '삼성동')
FROM DUAL;

-- EMPLOYEE 테이블에서 
-- 사원들의 이메일 주소를 'kh.or.kr'에서 'gmail.com'으로 변경하여 
-- 사원명, 기존 이메일, 바뀐 이메일 조회
SELECT EMP_NAME, EMAIL "기존 이메일",
    REPLACE(EMAIL, 'kh.or.kr', 'gmail.com') "바뀐 이메일"
FROM EMPLOYEE;

---------------------------------------------------------------------

-- 2. 숫자 처리 함수 

-- 1) MOD
-- 두 수를 나누어 나머지를 반환하는 함수
SELECT MOD(10, 3) FROM DUAL; 
SELECT MOD(-10, 3) FROM DUAL; 
SELECT MOD(10.9, 3) FROM DUAL; 

---------------------------------------------------------------------

-- 2) ROUND (반올림)
-- [작성법]
-- ROUND(컬럼명 | 숫자 [, 반올림 위치])
SELECT ROUND(123.456) FROM DUAL; 
--> ROUND의 기본값은 소수 첫번째 자리에서 반올림하여 정수를 반환함. 

SELECT ROUND(123.456, 1) FROM DUAL; -- 123.5

SELECT ROUND(123.456, 0) FROM DUAL; -- 123

SELECT ROUND(123.456, 2) FROM DUAL; -- 123.46

SELECT ROUND(123.456, -2) FROM DUAL; -- 100

----------------------------------------------------------------------

-- 3) CEIL (올림)
SELECT CEIL(123.1) FROM DUAL; 
SELECT CEIL(123.456 * 10)/10 FROM DUAL; -- 123.5

----------------------------------------------------------------------

-- 4) FLOOR (내림) 
SELECT FLOOR(123.1) FROM DUAL; --123
SELECT FLOOR(123.9) FROM DUAL; --123

SELECT CEIL(-10.9), FLOOR(-10.9) FROM DUAL;

--5) TRUNC(버림, 절삭)
SELECT TRUNC(123.456) FROM DUAL;
--> 소수점 모두 버림

SELECT TRUNC(123.456, 1) FROM DUAL;
SELECT TRUNC(123.456, 2) FROM DUAL;

SELECT CEIL(-10.9), FLOOR(-10.9), TRUNC(-10.9) FROM DUAL;

-------------------------------------------------------------------

-- 3. 날짜(DATE) 처리 함수

-- 1) SYSDATE : 시스템에 저장되어 있는 현재 날짜(시간)을 반환하는 함수
SELECT SYSDATE FROM DUAL; 

-- 2) MONTHS_BETWEEN(DATE, DATE)
-- 두 DATE의 개월 수 차이를 숫자로 리턴하는 함수

-- EMPLOYEE 테이블에서
-- 사원명, 입사일, 근무 개월 수 조회
SELECT EMP_NAME, HIRE_DATE, FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "근무 개월 수"
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서
-- 사원명, 입사일, 연차 조회
SELECT EMP_NAME, HIRE_DATE, CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) "연차"
FROM EMPLOYEE;

-- 3) ADD_MONTHS(날짜, 숫자)
-- 날짜에 숫자 만큼의 개월 수를 추가하여 반환
SELECT ADD_MONTHS(SYSDATE, 3) FROM DUAL; 

-- EMPLOYEE 테이블에서
-- 사원의 이름, 입사일, 입사일로 부터 6개월이 지난 날짜 조회
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 6)
FROM EMPLOYEE;

-- 4) LAST_DAY(날짜) : 해당 달의 마지막 날짜를 리턴
SELECT LAST_DAY('20/09/01') FROM DUAL; 

-- 5) EXTRACT : 날짜 데이터에서 년, 월, 일 정보를 추출하여 리턴
-- EXTRACT(YEAR FROM 날짜) : 연도 추출
-- EXTRACT(MONTH FROM 날짜) : 월 추출
-- EXTRACT(DAY FROM 날짜) : 일 추출

-- EMPLOYEE 테이블에서 
-- 사원명, 입사일의 년, 월, 일 조회
SELECT EMP_NAME, 
  EXTRACT(YEAR FROM HIRE_DATE) "년",
  EXTRACT(MONTH FROM HIRE_DATE) "월",
  EXTRACT(DAY FROM HIRE_DATE) "일"
FROM EMPLOYEE;

----------------------------------------------------------------
-- 실습문제

-- 1. EMPLOYEE 테이블에서 사원명, 입사일-오늘, 오늘-입사일 조회
-- 단, 입사일-오늘의 별칭은 "근무일수1", 
-- 오늘-입사일의 별칭은 "근무일수2"로 하고
-- 모두 정수(내림)처리, 양수가 되도록 처리
SELECT EMP_NAME,
  ABS (FLOOR(HIRE_DATE - SYSDATE)) 근무일수1,
  ABS (FLOOR(SYSDATE - HIRE_DATE)) 근무일수2
FROM EMPLOYEE;

-- 2. EMPLOYEE 테이블에서 사번이 홀수인 직원들의 정보 모두 조회
SELECT *
FROM EMPLOYEE
WHERE MOD(EMP_ID, 2) = '1' ;

-- 3. EMPLOYEE 테이블에서 근무 년수가 20년 이상인 직원 정보 조회
SELECT *
FROM EMPLOYEE
WHERE
MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12 >= 20;
--ADD_MONTHS(HIRE_DATE, 240) < SYSDATE; 

-- 4. EMPLOYEE 테이블에서 사원명, 입사일, 입사한 월의 근무일수를 조회
SELECT EMP_NAME, HIRE_DATE,
     LAST_DAY(HIRE_DATE)- HIRE_DATE + 1
  -- 마지막 날(입사한 날의) - 입사한 날 + 당일도 일했으므로 + 1
FROM EMPLOYEE;

-------------------------------------------------------------------

-- 4. 형변환 함수
/*             --- TO.CHAR ->           -- TO_DATE -->
        NUMBER <------------> CHARACTER <------------> DATE 
               <-TO_NUMBER --           <--TO_CHAR --
*/

-- 1) TO_CHAR(날짜|숫자 [, 포맷])
-- 날짜 또는 숫자형 데이터를 문자형으로 바꾸는 함수
-- 포맷 지정 시 포맷에 맞는 형태의 데이터로 변경하여 반환

-- [숫자]
SELECT TO_CHAR(1234) FROM DUAL; -- '1234'

-- 5칸 오른쪽 정렬, 빈칸 공백
SELECT TO_CHAR(1234, '99999') FROM DUAL; 

-- 5칸 오른쪽 정렬, 빈칸 0 채움
SELECT TO_CHAR(1234, '00000') FROM DUAL; 

--> 9, 0 둘 다 숫자를 채우겠다는 의미
  -- 9는 빈칸 / 0은 빈칸에 0 채움
  
-- 현재 설정된 나라의 화폐단위 + 세자리 수 마다 ,붙이기
SELECT TO_CHAR(10000, 'L99,999') FROM DUAL;

-- 다른 설정된 나라의 화폐단위 + 세자리 수 마다 ,붙이기
SELECT TO_CHAR(10000, '$99,999') FROM DUAL;

SELECT TO_CHAR(1000000, 'L99,999') FROM DUAL;
--> 설정한 포맷의 범위를 넘어서면 값이 모두 #으로 조회됨.

-- EMPLOYEE 테이블에서 
-- 모든 사원의 사원명, 급여, 연봉을 조회
-- 단, 급여, 연봉은 세자리 마다 ',' 구분 화폐기호 ￦ 추가
SELECT EMP_NAME,
   TRIM(TO_CHAR(SALARY, 'L999,999,999')) 급여,
   TRIM(TO_CHAR(SALARY*12, 'L999,999,999')) 연봉
FROM EMPLOYEE;

-- [날짜]
/* PM HH : AM / PM
   HH24 : 24시간 표기법
   MI : 분
   SS : 초
   YYYY : 2020년, YY : 20년
   MM : 월
   DAY : 금요일, DY : 금, D : 6(일요일 1 ~ 토요일 7)
   Q : 분기
*/

SELECT TO_CHAR(SYSDATE, 'PM HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD D Q') FROM DUAL;


-- EMPLOYEE 테이블에서
-- 모든 사원의 이름, 고용일 조회
-- 단, 고용일은 '2020-10-30 금' 형식으로 조회
SELECT EMP_NAME,
    TO_CHAR(HIRE_DATE,'YYYY-MM-DD DY')
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서
-- 모든 사원의 이름, 고용일 조회
-- 단, 고용일은 '2020년10월30일 금요일' 형식으로 조회
SELECT EMP_NAME,
    TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일" DAY')
FROM EMPLOYEE; 
-- 지정되지 않은 패턴을 사용하고 싶은 경우 ""(쌍따옴표)로 감싸서 작성. 


-- 2) TO_NUMBER (문자 [,포맷]) : 문자형 데이터를 숫자형 데이터로 형변환
-- 명시적으로 문자 -> 숫자변환
SELECT TO_NUMBER('100') + TO_NUMBER('200') FROM DUAL;

-- 묵시적 변환
SELECT '100' + '200' FROM DUAL; 
--> 오라클에 의해 문자형 데이터이지만, 숫자 또는 날짜의 형태를 띄고 있다면
-- 자동으로 형태를 변환시켜줌. 

SELECT TO_NUMBER('1,000,000', '9,999,999') FROM DUAL ;
--> 지정된 패턴의 형태를 띄는 문자열을 숫자로 변환

---------------------------------------------------------------------

-- 3) TO_DATE(문자 | 숫자 [, 포맷])

SELECT TO_DATE('20210101', 'YYYYMMDD') FROM DUAL;
SELECT TO_DATE(20210101, 'YYYYMMDD') FROM DUAL;

SELECT TO_DATE('950729', 'YYMMDD') FROM DUAL; -- 90/01/16

SELECT TO_CHAR (TO_DATE('950729', 'YYMMDD'),'YYYY-MM-DD') FROM DUAL; -- 1995-07-29
SELECT TO_CHAR (TO_DATE('950729', 'RRMMDD'),'YYYY-MM-DD') FROM DUAL; -- 1995-07-29

/* TO_DATE를 이용한 변환 시 YY, RR의 차이점
-- YY : 현재 세기를 적용 (21C == 20XX 년대)
-- RR : 읽어들인 값이 50년 이상이면 이전 세기(20C == 19XX년대)
--                  50년 미만이면 현재 세기(21C == 20XX년대) 적용
*/

-- EMPLOYEE 테이블에서 
-- 2000년도 이후에 입사한 사원의 사번, 이름, 입사일 조회
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
--WHERE HIRE_DATE >= '00/01/01'; --묵시적
WHERE HIRE_DATE >= TO_DATE('2000101', 'YYYYMMDD'); --명시적

-----------------------------------------------------------------

-- 5. NULL 처리 함수

-- 1) NVL(컬럼명, NULL인 경우 대체값) 
--> 해당 컬럼값이 NULL인 경우 대체값을 사용

-- EMPLOYEE 테이블에서
-- BONUS가 NULL인 사원의 컬럼값을 0으로 변환하여
-- 사원명, 급여, BONUS를 조회
SELECT EMP_NAME, SALARY, NVL(BONUS, 0) AS BONUS
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서
-- 부서코드가 NULL인 사원의 사번, 이름, 부서코드 조회
-- NULL인 부서코드 "부서 없음" 변환
SELECT EMP_ID, EMP_NAME, NVL(DEPT_CODE, '부서 없음')
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL; 

-- 2) NVL2(컬럼명, NULL 아닌 경우 대체값, NULL인 경우 대체값)

-- EMPLOYEE 테이블에서
-- 기존에 보너스를 받지 못하던 사원은 보너스율을 0.3
-- 받던 사원은 0.8로 변경하여 
-- 사원명, 기존 보너스, 변경된 보너스 조회

SELECT EMP_NAME,BONUS, NVL2(BONUS, 0.8, 0.3)
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서
-- 재직중인 사람은 '재직중'
-- 퇴사한 사람은 '퇴사(퇴사일)'로 변경하여
-- 사번, 사원명, 재직여부 조회

SELECT EMP_ID, EMP_NAME,
    NVL2(ENT_DATE, '퇴사('||ENT_DATE ||')', '재직중') -- 재직여부
FROM EMPLOYEE
ORDER BY ENT_DATE;

-----------------------------------------------------------------

-- 단일행 함수 연습 문제

--1. EMPLOYEE 테이블에서
--  직원명과 주민번호를 조회
--  단, 주민번호 9번째 자리부터 끝까지는 '*'문자로 채움
--  예 : 홍길동 771120-1******
SELECT EMP_NAME 직원명, RPAD(SUBSTR(EMP_NO, 1, 8) , 14, '*') 주민번호
FROM EMPLOYEE;

--2. EMPLOYEE 테이블에서
--  직원명, 직급코드, 연봉(원) 조회
--  단, 총수령액은 ￦57,000,000 으로 표시
--  (총수령액은 보너스가 적용된 1년치 급여)

-- NVL2(컬럼명, NULL 아닌 경우 대체값, NULL인 경우 대체값)

SELECT EMP_NAME 직원명, JOB_CODE 직급코드,
  TRIM(TO_CHAR((1+NVL(BONUS, 0))*SALARY * 12, 'L999,999,999')) 연봉
FROM EMPLOYEE; 

-- 3. EMPLOYEE 테이블에서
--   부서코드가 D5, D9인 직원들 중에서 2004년도에 입사한 직원의 
--	 사번 사원명 부서코드 입사일 조회
SELECT EMP_ID 사번, EMP_NAME 사원명, DEPT_CODE 부서코드, HIRE_DATE 입사일
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5', 'D9')
AND EXTRACT(YEAR FROM HIRE_DATE) = 2004;
--AND SUBSTR(HIRE_DATE,1,2) = 04; 

-- 4. EMPLOYEE 테이블에서
--   직원명, 입사일, 입사한 달의 근무일수 조회
--   단, 입사한 날도 근무일수에 포함해서 +1 할 것
SELECT EMP_NAME 직원명, HIRE_DATE 입사일,
    LAST_DAY(HIRE_DATE)- HIRE_DATE + 1 "입사한 달의 근무일수"
FROM EMPLOYEE;

-- 5. EMPLOYEE 테이블에서
--  직원명, 부서코드, 생년월일, 나이(만) 조회
--  단, 생년월일은 주민번호에서 추출해서, 
--  ㅇㅇ년 ㅇㅇ월 ㅇㅇ일로 출력되게 함.
--  나이는 주민번호에서 추출해서 날짜데이터로 변환한 다음, 계산.

SELECT EMP_NAME, DEPT_CODE,
TO_CHAR(TO_DATE(SUBSTR(EMP_NO,1,6)), 'YY"년" MM"월" DD"일"') 생년월일,
FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR(EMP_NO,1,6),'RRMMDD'))/12) "나이(만)",
        -- 개월 수
FLOOR((SYSDATE - TO_DATE(SUBSTR(EMP_NO,1,6),'RRMMDD'))/365) "나이2(만)"
        -- 일 수
FROM EMPLOYEE;

-------------------------------------------------------------------

-- 6. 선택 함수
-- 여러 가지 경우에 따라 선택을 할 수 있는 기능을 제공하는 함수

-- 1) DECODE(컬럼명 | 계산식, 결과1, 선택1, 결과2, 선택2, 결과3, 선택3, ... , 나머지)
-- 계산식 또는 컬럼 값이 결과와 일치하면 해당 선택 값을 반환
-- (JAVA switch 와 비슷)

-- EMPLOYEE 테이블에서
-- 사번, 이름, 주민등록번호, 성별(남/여) 조회
SELECT EMP_ID, EMP_NAME, EMP_NO,
    DECODE( SUBSTR(EMP_NO,8,1),'1','남','2','여' ) AS 성별 
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서
-- 직원의 급여를 인상하고자 한다. 
-- 직급 코드가 'J7'인 직원은 10% 인상
-- 'J6'인 직원은 15% 인상
-- 'J5'인 직원은 20% 인상
-- 그 외 직급은 5% 인상
-- 사원명, 직급코드, 기존 급여, 인상 급여를 
-- 직급 코드 오름차순으로 정렬하여 조회
SELECT EMP_NAME, JOB_CODE, SALARY,
    DECODE(JOB_CODE, 'J7', SALARY * 1.1,
                    'J6', SALARY * 1.15,
                    'J5', SALARY * 1.2,
                    SALARY * 1.05) "인상 급여"
FROM EMPLOYEE
ORDER BY JOB_CODE;

-- 2) CASE문
/* [작성법]
    CASE WHEN 조건식1 THEN 결과 1 
         WHEN 조건식2 THEN 결과 2
         WHEN 조건식3 THEN 결과 3
         ...
         ELSE 나머지결과
    END 
*/

-- EMPLOYEE 테이블에서
-- 직원의 급여를 인상하고자 한다. 
-- 직급 코드가 'J7'인 직원은 10% 인상
-- 'J6'인 직원은 15% 인상
-- 'J5'인 직원은 20% 인상
-- 그 외 직급은 5% 인상
-- 사원명, 직급코드, 기존 급여, 인상 급여를 
-- 직급 코드 오름차순으로 정렬하여 조회
SELECT EMP_NAME, JOB_CODE, SALARY,
    CASE WHEN JOB_CODE = 'J7' THEN SALARY * 1.1
         WHEN JOB_CODE = 'J6' THEN SALARY * 1.15
         WHEN JOB_CODE = 'J5' THEN SALARY * 1.2
         ELSE SALARY * 1.05
    END "인상 급여"
FROM EMPLOYEE
ORDER BY 2;

-- EMPLOYEE 테이블에서 사번, 이름, 급여, 개발자 등급 조회
-- 개발자 등급 기준
-- 급여 500만 이상 : '고급'
-- 500만 미만, 300만 이상 : '중급'
-- 300만 미만 : '초급'
SELECT EMP_ID, EMP_NAME, SALARY,
    CASE WHEN SALARY >= 5000000 THEN '고급'
         --WHEN SALARY >= 3000000 AND SALARY < 5000000 THEN '중급'
         WHEN SALARY >= 3000000 THEN '중급'
         ELSE '초급'
    END "개발자 등급"
FROM EMPLOYEE;

--------------------------------------------------------------------

-- [그룹 함수]
-- 하나 이상의 행을 그룹으로 묶어 연산한 후 하나의 결과를 반환하는 함수

-- 1) SUM(숫자가 기록된 컬럼명) : 해당 컬럼의 총합을 반환

-- EMPLOYEE 테이블에서 모든 사원의 급여 총합 조회
SELECT SUM(SALARY) FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 여자 사원의 급여 총합 조회
SELECT SUM(SALARY) FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) = 2; 

-- EMPLOYEE 테이블에서
-- 부서코드가 'D5'인 직원의 보너스 포함 연봉 총합 조회
SELECT SUM(SALARY * (1+NVL(BONUS, 0)) * 12) 
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';

-- 2) AVG(숫자가 기록된 컬럼명) : 그룹의 평균을 반환
-- EMPLOYEE 테이블에서 모든 사원의 급여 합, 급여 평균 조회
SELECT SUM(SALARY), FLOOR(AVG(SALARY)) FROM EMPLOYEE;

-- 3) MIN(컬럼명) : 그룹 중 지정된 컬럼에서 가장 작은 값 반환
--    MAX(컬럼명) : 그룹 중 지정된 컬럼에서 가장 큰 값 반환

-- EMPLOYEE 테이블에서 이름 순서가 가장 빠른 사람과 마지막 사람 조회
SELECT MIN(EMP_NAME), MAX(EMP_NAME) FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 이메일 순서가 가장 빠른 사람과 마지막 사람 조회
SELECT MIN(EMAIL), MAX(EMAIL) FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 급여가 가장 적은 사람 / 높은 사람 조회
SELECT MIN(SALARY), MAX(SALARY) FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 입사일이 가장 빠른 사람과 마지막 입사한 사람 조회
SELECT MIN(HIRE_DATE), MAX(HIRE_DATE) FROM EMPLOYEE;

-- EMPLOYEE 테이블에서
-- 전체 급여합,
-- 전체 급여 평균,
-- 가장 많이 받는 사람의 급여,
-- 가장 적게 받는 사람의 급여 조회
SELECT SUM(SALARY),FLOOR(AVG(SALARY)),MAX(SALARY),MIN(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE = '05';

-- 4) COUNT(*|[DISTINCT]컬럼명): 조회되는 행의 개수를 헤아려서 반환 
-- COUNT(*) : NULL을 포함한 모든 행의 개수를 반환
-- COUNT(컬럼명) : 해당 컬럼의 컬럼 값중 NULL을 제외한 개수를 반환
-- COUNT(DISTINCT 컬럼명) : 중복된 행 제거 + NULL 제외 한 행의 개수를 반환

-- EMPLOYEE 테이블에서
-- 모든 사원의 수,
-- 부서코드가 있는 사원의 수,
-- 사원이 속해 있는 부서의 수 조회 
SELECT COUNT(*), COUNT(DEPT_CODE), COUNT(DISTINCT DEPT_CODE)
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 급여가 300만 이상인 사원의 수 조회
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SALARY >= 3000000;


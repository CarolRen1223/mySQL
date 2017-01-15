#找出animals文件夹里name那一列的最大值，如果是字母的话，就是最靠后的字母
QUERY = "select max(name) from animals;"



#星号就是所有列的意思，然后limit的用法如下：
#SELECT * FROM table LIMIT 5,10;  // 检索记录行 6-15
#SELECT * FROM table LIMIT 95,-1; // 检索记录行 96-最后一个
#SELECT * FROM table LIMIT 5;     //检索前 5 个记录行
QUERY = "select * from animals limit 10;"



#如果您使用 ORDER BY 关键词，记录集的排序顺序默认是升序（1 在 9 之前，"a" 在 "p" 之前）
#请使用 DESC 关键词来设定降序排序（9 在 1 之前，"p" 在 "a" 之前）：
QUERY = "select * from animals where species = 'orangutan' order by birthdate;"
QUERY = "select name from animals where species = 'orangutan' order by birthdate desc;"



# QUERY = "select name, birthdate from animals order by name limit 10 offset 20;"

# QUERY = "select species, min(birthdate) from animals group by species;"

# QUERY = '''
# select name, count(*) as num from animals
# group by name
# order by num desc
# limit 5;
# '''

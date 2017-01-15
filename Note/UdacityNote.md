# SQL笔记
Udacity-Intro to Relational Databases Notes
## SELECT ##

    QUERY = "select max(name) from animals;"
找出animals表里name那一列的最大值，如果是字母的话，就是最靠后的字母


----------


    QUERY = "select * from animals limit 10;"

星号就是所有列的意思，然后limit的用法如下：
SELECT * FROM table LIMIT 5,10;  // 检索记录行 6-15
SELECT * FROM table LIMIT 95,-1; // 检索记录行 96-最后一个
SELECT * FROM table LIMIT 5;     //检索前 5 个记录行


----------


    QUERY = "select * from animals where species = 'orangutan' order by birthdate;"
    QUERY = "select name from animals where species = 'orangutan' order by birthdate desc;`"
如果使用 ORDER BY 关键词，记录集的排序顺序默认是升序（1 在 9 之前，"a" 在 "p" 之前）
使用 DESC 关键词来设定降序排序（9 在 1 之前，"p" 在 "a" 之前）


----------

    QUERY = "select name, birthdate from animals order by name limit 10 offset 20;"
语句1：select * from student limit 9,4
语句2：slect * from student limit 4 offset 9
// 语句1和2均返回表student的第10、11、12、13行  
//语句2中的4表示返回4行，9表示从表的第十行开始
据说offset和limit一起的语句比直接用limit要快？


----------

    QUERY = "select species, min(birthdate) from animals group by species;"
GROUP BY 语句用于结合合计函数，根据一个或多个列对结果集进行分组
这段code就是生成一个表格，有两列，第一列是物种（不重复），第二列是这个物种下面最“小”的出生日期


----------

    QUERY = '''
    select name, count(*) as num from animals
    group by name
    order by num desc
    limit 5;
    '''
我们分解来看
首先，如果我们

    QUERY = '''select name from animals
    group by name;
    '''
会得到
|        name |
--------------|
|      Adiaha |
|      Alison |
|      Andrea |
|       Bacon |
|       Becky |
|         Ben |
|    Bertrand |
|        Biff |
|后面还有很长


接下来我们添加一个count（）函数来看看

    QUERY = ''' select name, count(*) as num from animals
    group by name;
    '''
   name | num |
-------|
|      Adiaha |   1 |
|      Alison |   1 |
|      Andrea |   2 |
|       Bacon |   1 |
|       Becky |   1 |
|         Ben |   1 |
|    Bertrand |   1 |
|        Biff |   1 |
|       Bjorn |   1 |
|后面依然很长

这个时候就是新建一个num列，列里面是每个name的个数，我们会发现有些名字出现次数比较高（这个表没展示完，因为太长了）

那么我们想知道出现次数最多的名字，所以我们可以让num倒序排列

    QUERY = ''' select name, count(*) as num from animals
    group by name
    order by num desc;
    '''
结果如下:
|        name | num |
----|
|      George |   4 |
|      Andrea |   2 |
|     Charlie |   2 |
|        John |   2 |
|         Max |   2 |
|        Spot |   2 |
|      Adiaha |   1 |
|      Alison |   1 |
|       Bacon |   1 |
|后面还有没列出

那么如果我们只想看看出现次数最多的前5项，那么就再加一句

    limit 5
最后显示如下:
|    name | num |
----|
|  George |   4 |
|  Andrea |   2 |
| Charlie |   2 |
|    John |   2 |
|     Max |   2 |

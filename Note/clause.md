----------

    QUERY = "select species, min(birthdate) from animals group by species;"
GROUP BY 语句用于结合合计函数，根据一个或多个列对结果集进行分组
比方说，species下面有很多动物，

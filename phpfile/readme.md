# 技巧
1. 使用[select table_name from information_schema.tables where table_schema='$database'](https://zhidao.baidu.com/question/579971553.html)来得到所有的表名或者**show tables**
2. [分割线](https://blog.csdn.net/weixin_39198406/article/details/78827671)
3. **desc table_name**显示列属性
4. trigger中定义的varchar必须有长度，且declare的变量必须在开头
5. 一条trigger阻断会影响下一条trigger发生，务必检查每一条trigger的正确性，比如，插入与更新次数

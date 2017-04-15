#!/bin/bash

sql_file="tmp.sql"

function gen_person_insert_sql()
{
	name="'$1'"

	sql_cmd="insert into persons (person_name) values ($name);"
	printf "$sql_cmd \\n" >> $sql_file
	
	sql_cmd="select last_insert_id() into @person_id;"
	printf "$sql_cmd \\n" >> $sql_file

	order_count=`expr $RANDOM % 5 + 1`
	for (( j=0; j<$order_count; j++ ))
	do
		order_info="detail_$RANDOM"
		sql_cmd="insert into orders (order_detail, person_id) values ('$order_info', @person_id);"
		printf "$sql_cmd \\n" >> $sql_file

	done
}


echo "use role_test;" > $sql_file
echo "set foreign_key_checks=0;" >> $sql_file
echo "truncate orders;" >> $sql_file
echo "truncate persons;" >> $sql_file
echo "set foreign_key_checks=1;" >> $sql_file

person_max_num=100

for (( i=0; i<$person_max_num; ++ i ))
do
	name="name_$RANDOM"

	#echo $name

	gen_person_insert_sql $name 

	name_list[$i]=$name
done

for name in ${name_list[*]}
do
	echo $name
done

mysql -uroot -pxiaolzz < $sql_file



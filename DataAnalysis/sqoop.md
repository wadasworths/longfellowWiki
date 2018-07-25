### sqoop

```
sqoop import -Dorg.apache.sqoop/splitter.allow_text_splitter=true \
	--connect ${connect} \
	--username ${username} \
	--password ${password} \
	--mapreduce-job-name "mapreduce-name" \
	--target-dir /user/hive/warehouse/ \
	--fetch-size 1000 \
    --hive-drop-import-delims \
    --null-string '\\N' \
    --null-non-string '\\N' \
    --fields-terminated-by '\001' \
    --lines-terminated-by '\n' \
    -m 1 \
    --query "${sql}" \
    --delete-target-dir 

```

### JDBC SID && service_name

```
connect="jdbc:oracle:thin:@"
```
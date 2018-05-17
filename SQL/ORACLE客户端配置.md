###

pwd=/usr/oracle/app/product/11.2.0.1/client/network/admin

ll

samples
shrept.lst
tnsnames.ora


testhost = 
	(DESCRIPTION =
		(ADDRESS_LIST = 
			(ADDRESS = (PROTOCOL = TCP) (HOST = 109.1.0.1) (PORT = 3306))
		)
		(CONNECT_DATA = 
			(SID = $ORACLE_SID)
		)
	)
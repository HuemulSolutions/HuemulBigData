
CREATE TABLE control_config (   config_id		int
				 				,version_mayor	int
				                ,version_minor	int
				                ,version_patch	int
								,config_dtlog	varchar(50)
								,primary key (config_id));

create table  control_executors (
                                              application_id         varchar(100)
                                             ,idsparkport            varchar(50)
                                             ,idportmonitoring       varchar(500)
                                             ,executor_dtstart       varchar(30)
                                             ,executor_name          varchar(100)
                                             ,primary key (application_id)
                                            );

create table  control_singleton (
                                              singleton_id         varchar(100)
                                             ,application_id       varchar(100)
                                             ,singleton_name       varchar(100)
                                             ,mdm_fhcreate         varchar(30)
                                             ,primary key (singleton_id)
                                            );
        
create table  control_area (
                                              area_id              varchar(50)
											 ,area_idpadre		   varchar(50)
                                             ,area_name            varchar(100)
                                             ,mdm_fhcreate         varchar(30)
                                             ,mdm_processname      varchar(200)
                                             ,primary key (area_id)
                                            );
                             
create table  control_process ( 
                                              process_id           varchar(200)
                                             ,area_id              varchar(50)
                                             ,process_name         varchar(200)
                                             ,process_filename     varchar(200)
                                             ,process_description  varchar(1000)
                                             ,process_owner        varchar(200)
											 ,process_frequency    varchar(50)
                                             ,mdm_manualchange     int
                                             ,mdm_fhcreate         varchar(30)
                                             ,mdm_processname      varchar(200)
                                             ,primary key (process_id)
                                            );
                             
create table  control_processexec ( 
                                              processexec_id          varchar(50)
                                             ,processexec_idparent    varchar(50)
                                             ,process_id              varchar(200)
                                             ,malla_id                varchar(50)
                                             ,application_id          varchar(100)
                                             ,processexec_isstart     int
                                             ,processexec_iscancelled int
                                             ,processexec_isenderror  int
                                             ,processexec_isendok     int
                                             ,processexec_dtstart     varchar(30)
                                             ,processexec_dtend       varchar(30)
                                             ,processexec_durhour     int
                                             ,processexec_durmin      int
                                             ,processexec_dursec      int
                                             ,processexec_whosrun     varchar(200)
                                             ,processexec_debugmode   int
                                             ,processexec_environment varchar(200)
											 ,processexec_param_year	int 
											 ,processexec_param_month	int 
											 ,processexec_param_day		int 
											 ,processexec_param_hour	int 
											 ,processexec_param_min		int 
											 ,processexec_param_sec		int 
											 ,processexec_param_others	varchar(1000) 
											 ,processexec_huemulversion varchar(50)
											 ,processexec_controlversion varchar(50)
                                             ,error_id                varchar(50)
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)
                                             ,primary key (processexec_id) 
                                            );
                             
create table  control_processexecparams ( 
                                              processexec_id          varchar(50)
                                             ,processexecparams_name  varchar(500)
                                             ,processexecparams_value varchar(4000)
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)
                                             ,primary key (processexec_id, processexecparams_name) 
                                            );
                   
create table  control_processexecstep ( 
                                              processexecstep_id      varchar(50)
                                             ,processexec_id          varchar(50)
                                             ,processexecstep_name        varchar(200)
                                             ,processexecstep_status      varchar(20)  
                                             ,processexecstep_dtstart     varchar(30)
                                             ,processexecstep_dtend       varchar(30)
                                             ,processexecstep_durhour     int
                                             ,processexecstep_durmin      int
                                             ,processexecstep_dursec      int
                                             ,error_id                varchar(50)
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)
                                             ,primary key (processexecstep_id) 
                                            );
                                            
                                            
create table control_query 		(query_id			     varchar(50)
								,processexecstep_id      varchar(50)
                                ,processexec_id          varchar(50)      
                                ,rawfiles_id             varchar(50)
                                ,rawfilesdet_id		     varchar(50)
                                ,table_id                varchar(50)
                                ,query_alias			 varchar(200)
                                ,query_sql_from		     varchar(4000)
                                ,query_sql_where		 varchar(4000)
                                ,query_numerrors	     int
                                ,query_autoinc			 int
                                ,query_israw			 int
                                ,query_isfinaltable	     int
                                ,query_isquery			 int
                                ,query_isreferenced		 int
                                ,query_numrows_real		 int
                                ,query_numrows_expected  int
                                ,query_duration_hour	 int
                                ,query_duration_min		 int
                                ,query_duration_sec		 int			 
                                ,error_id                varchar(50)
                                ,mdm_fhcreate            varchar(30)
                                ,mdm_processname         varchar(200)    
                                ,primary key (query_id)
                                );
                                
create table control_querycolumn 	  (querycol_id					varchar(50)
									  ,query_id						varchar(50)
									  ,rawfilesdet_id               varchar(50)
									  ,column_id                  	varchar(50)
									  ,querycol_pos					int
									  ,querycol_name				varchar(200)
									  ,querycol_sql					varchar(4000)
									  ,querycol_posstart			int
									  ,querycol_posend				int
									  ,querycol_line				int
									  ,mdm_fhcreate            varchar(30)
                                	  ,mdm_processname         varchar(200)    
									  ,primary key (querycol_id)
                                );
                                
create index idx_control_querycolumn_i01 on control_querycolumn (query_id, querycol_name);
                                
create table control_querycolumnori		(querycolori_id					varchar(50)       
										,querycol_id					varchar(50)
										,table_idori                	varchar(50)
										,column_idori					varchar(50)
										,rawfilesdet_idori             	varchar(50)
										,rawfilesdetfields_idori		varchar(50)
										,query_idori					varchar(50)
										,querycol_idori					varchar(50)
										,querycolori_dbname				varchar(200)
										,querycolori_tabname			varchar(200)
										,querycolori_tabalias		 	varchar(200)
										,querycolori_colname			varchar(200)	
										,querycolori_isselect			int
										,querycolori_iswhere			int
										,querycolori_ishaving			int
										,querycolori_isorder			int
										,mdm_fhcreate            varchar(30)
                                		,mdm_processname         varchar(200)    
										,primary key (querycolori_id)
                                );				                 
									                                                                     
                    
create table  control_rawfiles ( 
                                              rawfiles_id             varchar(50)
                                             ,area_id                 varchar(50)
                                             ,rawfiles_logicalname    varchar(500)
                                             ,rawfiles_groupname      varchar(500)
                                             ,rawfiles_description    varchar(1000)
                                             ,rawfiles_owner          varchar(200)
                                             ,rawfiles_frequency      varchar(200)
                                             ,mdm_manualchange        int
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)
                                             ,primary key (rawfiles_id) 
                                            );

create index idx_control_rawfiles_i01 on control_rawfiles (rawfiles_logicalname, rawfiles_groupname);
create unique index idx_control_rawfiles_i02 on control_rawfiles (rawfiles_logicalname);
                                    
create table  control_rawfilesdet ( 
                                              rawfilesdet_id                            varchar(50)
                                             ,rawfiles_id                               varchar(50)
                                             ,rawfilesdet_startdate                     varchar(30)
                                             ,rawfilesdet_enddate                       varchar(30)
                                             ,rawfilesdet_filename                      varchar(1000)
                                             ,rawfilesdet_localpath                     varchar(1000)
                                             ,rawfilesdet_globalpath                    varchar(1000)
                                             ,rawfilesdet_data_colseptype         varchar(50)
                                             ,rawfilesdet_data_colsep             varchar(50)
                                             ,rawfilesdet_data_headcolstring      varchar(4000)
                                             ,rawfilesdet_log_colseptype          varchar(50)
                                             ,rawfilesdet_log_colsep              varchar(50)
                                             ,rawfilesdet_log_headcolstring       varchar(4000)
                                             ,rawfilesdet_log_numrowsfield         varchar(200)
                                             ,rawfilesdet_contactname                   varchar(200)
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)
                                             ,primary key (rawfilesdet_id) 
                                            );

create index idx_control_rawfilesdet_i01 on control_rawfilesdet (rawfiles_id, rawfilesdet_startdate);
                                                       
create table  control_rawfilesdetfields ( 
                                              rawfilesdet_id                  varchar(50)
											 ,rawfilesdetfields_logicalname          varchar(200)
                                             ,rawfilesdetfields_itname          varchar(200)
                                             ,rawfilesdetfields_description          varchar(1000)
                                             ,rawfilesdetfields_datatype            varchar(50)
                                             ,rawfilesdetfields_position      int
                                             ,rawfilesdetfields_posini        int
                                             ,rawfilesdetfields_posfin        int
                                             ,rawfilesdetfields_applytrim     int
                                             ,rawfilesdetfields_convertnull   int
											 ,mdm_active			  int
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)
                                             ,primary key (rawfilesdet_id, rawfilesdetfields_logicalname) 
                                            );
											
                  
create table  control_rawfilesuse ( 
                                              rawfilesuse_id          varchar(50)
                                             ,rawfiles_id             varchar(50)
                                             ,process_id              varchar(200)
                                             ,processexec_id          varchar(50)
                                             ,rawfilesuse_year        int
                                             ,rawfilesuse_month       int
                                             ,rawfilesuse_day         int
                                             ,rawfilesuse_hour        int
                                             ,rawfilesuse_minute       int
                                             ,rawfilesuse_second      int
                                             ,rawfilesuse_params      varchar(1000)
                                             ,rawfiles_fullname       varchar(1000)
                                             ,rawfiles_fullpath       varchar(1000)
                                             ,rawfiles_numrows        varchar(50)
                                             ,rawfiles_headerline     varchar(4000)
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)
                                             ,primary key (rawfilesuse_id) 
                                            );
                   
create table  control_tables ( 
                                              table_id                varchar(50)
                                             ,area_id                 varchar(50)
                                             ,table_bbddname          varchar(200)
                                             ,table_name              varchar(200)
                                             ,table_description       varchar(1000)
                                             ,table_businessowner     varchar(200)
                                             ,table_itowner           varchar(200)
                                             ,table_partitionfield    varchar(200)
                                             ,table_tabletype         varchar(50)  
											 ,table_compressiontype   varchar(50)  
                                             ,table_storagetype       varchar(50)
                                             ,table_localpath         varchar(1000)
                                             ,table_globalpath        varchar(1000)
                                             ,table_fullname_dq		  varchar(1200)
                                             ,table_dq_isused		  int
                                             ,table_fullname_ovt	  varchar(1200)
                                             ,table_ovt_isused		  int                                             
                                             ,table_sqlcreate         varchar(4000)
											 ,table_frequency		  varchar(200)
											 ,table_autoincupdate     int
											 ,table_backup		 	  int
                                             ,mdm_manualchange        int
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)                                             
                                             ,primary key (table_id) 
                                            );

create unique index idx_control_tables_i01 on control_tables (table_bbddname, table_name );
                   
create table  control_tablesrel (                   
                                              tablerel_id               varchar(50)
                                             ,table_idpk                varchar(50)
                                             ,table_idfk                varchar(50)
                                             ,tablefk_namerelationship  varchar(100)
                                             ,tablerel_validnull        int
                                             ,mdm_manualchange          int
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)                                             
                                             ,primary key (tablerel_id) 
                                            );

create index idx_control_tablesrel_i01 on control_tablesrel (table_idpk, table_idfk, tablefk_namerelationship); 											
                    
create table  control_tablesrelcol ( 
                                              tablerel_id                varchar(50)
                                             ,column_idfk                varchar(50)
                                             ,column_idpk                varchar(50)
                                             ,mdm_manualchange           int
                                             ,mdm_fhcreate               varchar(30)
                                             ,mdm_processname            varchar(200)
                                             ,primary key (tablerel_id, column_idfk) 
                                            );
                                                                       
                    
create table  control_columns ( 
                                              column_id                  varchar(50)
                                             ,table_id                   varchar(50)
                                             ,column_position            int
                                             ,column_name                varchar(200)
                                             ,column_description         varchar(1000)
                                             ,column_formula             varchar(1000)
                                             ,column_datatype            varchar(50)
                                             ,column_sensibledata        int
                                             ,column_enabledtlog         int
                                             ,column_enableoldvalue      int
                                             ,column_enableprocesslog    int
                                             ,column_enableoldvaluetrace int
                                             ,column_defaultvalue        varchar(1000)
                                             ,column_securitylevel       varchar(200)
                                             ,column_encrypted           varchar(200)
                                             ,column_arco                varchar(200)
                                             ,column_nullable            int
                                             ,column_ispk                int
                                             ,column_isunique            int
                                             ,column_dq_minlen           int
                                             ,column_dq_maxlen           int 
                                             ,column_dq_mindecimalvalue  decimal(30,10) 
                                             ,column_dq_maxdecimalvalue  decimal(30,10) 
                                             ,column_dq_mindatetimevalue varchar(50) 
                                             ,column_dq_maxdatetimevalue varchar(50)
											 ,column_dq_regexp           varchar(1000)
											 ,column_businessglossary	 varchar(100)
                                             ,column_responsible         varchar(100)
                                             ,mdm_active                 int
                                             ,mdm_manualchange           int
                                             ,mdm_fhcreate               varchar(30)
                                             ,mdm_processname            varchar(200)
                                             ,primary key (column_id) 
                                            );

create index idx_control_columns_i01 on control_columns (table_id, column_name);
                                                                       
                   
create table  control_tablesuse (			  tablesuse_id            varchar(50)  
                                             ,table_id                varchar(50)
                                             ,process_id              varchar(200)
                                             ,processexec_id          varchar(50)
                                             ,processexecstep_id      varchar(50)
                                             ,tableuse_year        int
                                             ,tableuse_month       int
                                             ,tableuse_day         int
                                             ,tableuse_hour        int
                                             ,tableuse_minute       int
                                             ,tableuse_second      int
                                             ,tableuse_params      varchar(1000)
                                             ,tableuse_read           int
                                             ,tableuse_write          int
                                             ,tableuse_numrowsnew     int
                                             ,tableuse_numrowsupdate  int
											 ,tableuse_numrowsupdatable  int
											 ,tableuse_numrowsnochange  int
                                             ,tableuse_numrowsmarkdelete  int
                                             ,tableuse_numrowstotal   int
                                             ,tableuse_numrowsexcluded			  int
											 ,tableuse_partitionvalue varchar(200)
											 ,tableuse_pathbackup	  varchar(1000)
											 ,tableuse_backupstatus			  int
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)
                                             ,primary key (tablesuse_id) 
                                            );
                                            
                                            
 CREATE INDEX IDX_control_tablesuse_I01 ON control_tablesuse (tableuse_backupstatus);
                                             
                    
create table  control_dq (
                                              dq_id                   varchar(50) 
                                             ,table_id                varchar(50) 
                                             ,process_id              varchar(200)
                                             ,processexec_id          varchar(50)
                                             ,column_id               varchar(50)
                                             ,column_name             varchar(200)
                                             ,dq_aliasdf              varchar(200)
                                             ,dq_name                 varchar(200)
                                             ,dq_description          varchar(1000)
                                             ,dq_querylevel           varchar(50)
                                             ,dq_notification         varchar(50)
                                             ,dq_sqlformula           varchar(4000)
                                             ,dq_dq_toleranceerror_rows     int
                                             ,dq_dq_toleranceerror_percent     decimal(30,10)
                                             ,dq_resultdq             varchar(4000)
                                             ,dq_errorcode            int
                                             ,dq_externalcode         varchar(200)
                                             ,dq_numrowsok            int
                                             ,dq_numrowserror         int
                                             ,dq_numrowstotal         int
                                             ,dq_iserror              int
                                             ,dq_iswarning			  int
                                             ,dq_duration_hour		  int
                                             ,dq_duration_minute	  int
                                             ,dq_duration_second	  int
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)
                                             ,primary key (dq_id) 
                                            );
                    
                   
create table  control_error ( 
                                              error_id          varchar(50)
                                             ,error_message                varchar(4000)
                                             ,error_code           int
                                             ,error_trace                varchar(4000)
                                             ,error_classname                varchar(100)
                                             ,error_filename                varchar(500)
                                             ,error_linenumber                varchar(100)
                                             ,error_methodname                varchar(100)
                                             ,error_detail                varchar(500)
                                             ,mdm_fhcrea            varchar(30)
                                             ,mdm_processname         varchar(1000)
                                             ,primary key (error_id)
                                            );
                                                                       
                  
create table  control_date ( 
                                      date_id		varchar(10)
                                      ,date_year	int
                                      ,date_month	int
                                      ,date_day	int
                                      ,date_dayofweek	int
                                      ,date_dayname	varchar(20)
                                      ,date_monthname	varchar(20)
                                      ,date_quarter	int
                                      ,date_week	int
                                      ,date_isweekend	int
                                      ,date_isworkday	int
                                      ,date_isbankworkday	int
                                      ,date_numworkday		int
                                      ,date_numworkdayrev	int
                                      ,mdm_fhcreate            varchar(30)
                                      ,mdm_processname         varchar(200) 
                                      ,primary key (date_id) 
                                      );
                                                                       
                 
create table  control_testplan ( 
                                              testplan_id             varchar(200)
                                             ,testplangroup_id        varchar(200)
                                             ,processexec_id          varchar(200)
                                             ,process_id              varchar(200)
                                             ,testplan_name           varchar(200)
                                             ,testplan_description    varchar(1000)
                                             ,testplan_resultexpected varchar(1000)  
                                             ,testplan_resultreal     varchar(1000)
                                             ,testplan_isok           int
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)
                                             ,primary key (testplan_id) 
                                            );
                                            
create index idx_control_testplan_i01 on control_testplan (testplangroup_id, testplan_name);
                             

create table  control_testplanfeature ( 
                                              feature_id              varchar(200)
                                             ,testplan_id             varchar(200)
                                             ,mdm_fhcreate            varchar(30)
                                             ,mdm_processname         varchar(200)
                                             ,primary key (feature_id, testplan_id) 
                                            );
                             

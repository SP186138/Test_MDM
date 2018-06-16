REPLACE VIEW MDM.LOAD_INFO(                                                    
                   LOAD_ID                                                                       
                  ,PROCESS_NAME                                                                  
                  ,PROCESS_START_TIME                                                            
                  ,PROCESS_END_TIME                                                              
                  ,ERROR_MSG_TXT                                                                 
                  ,STATUS                                                                        
                  ,BATCH_ID                                                                      
                  ,NC_TYPE         
                  ,CNTRY_NAME
                  ,SYS_TARGET_ID                                                                 
                  ,SYS_AUTH_ID                                                                   
                  ,SYS_SOURCE                                                                    
                  ,SYS_CREATED_BY                                                                
                  ,SYS_CREATION_DATE                                                             
                  ,SYS_ENT_STATE                                                                 
                  ,SYS_LAST_MODIFIED_BY                                                          
                  ,SYS_LAST_MODIFIED_DATE                                                        
                  ,SYS_NC_TYPE                                                                   
                  ,SYS_ERR_CODE                                                                  
                  ,SYS_ERR_SVRTY                                                                 
                 ) AS LOCKING ROW FOR ACCESS SELECT                                              
                   LOAD_ID                                                                       
                  ,PROCESS_NAME                                                                  
                  ,PROCESS_START_TIME                                                            
                  ,PROCESS_END_TIME                                                              
                  ,ERROR_MSG_TXT                                                                 
                  ,STATUS                                                                        
                  ,BATCH_ID                                                                      
                  ,NC_TYPE             
                  ,CNTRY_NAME
                  ,SYS_TARGET_ID                                                                 
                  ,SYS_AUTH_ID                                                                   
                  ,SYS_SOURCE                                                                    
                  ,SYS_CREATED_BY                                                                
                  ,SYS_CREATION_DATE                                                             
                  ,SYS_ENT_STATE                                                                 
                  ,SYS_LAST_MODIFIED_BY                                                          
                  ,SYS_LAST_MODIFIED_DATE                                                        
                  ,SYS_NC_TYPE                                                                   
                  ,SYS_ERR_CODE                                                                  
                  ,SYS_ERR_SVRTY                                                                 
                 FROM MDM.LOAD_INFO2;
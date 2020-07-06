package com.huemulsolutions.bigdata.datalake

import java.util.Calendar
import scala.collection.mutable.ArrayBuffer
import com.huemulsolutions.bigdata.common.huemul_BigDataGovernance
import com.huemulsolutions.bigdata.common.huemul_KeyValuePath
import huemulType_FileType._

class huemul_DataLakeSetting(huemulBigDataGov: huemul_BigDataGovernance) extends Serializable {
  /***
   * Start date for this configuration
   */
  var StartDate : Calendar = _
  /***
   * End date for this configuration
   */
  var EndDate : Calendar = _
  /***
   * Type (example: TEXT_FILE, EXCEL_FILE)
   */
  var FileType: huemulType_FileType = _
  /***
   * File Name (example: "PLAN-CTAS.TXT")
   */
  var FileName    : String = ""  
  /***
   * Local name (example "SBIF\\{{YYYY}}{{MM}}\\"
   */
  var LocalPath   : String= ""
  /***
   * from Global path
   */
  var GlobalPath  : ArrayBuffer[huemul_KeyValuePath] = _
  /***
   * Responsible contact to resolve doubt or errors
   */
  var ContactName :  String= ""
  
  /***
   * Data Schema configuration
   */
  var DataSchemaConf: huemul_DataLakeSchemaConf = new  huemul_DataLakeSchemaConf()
  
  /***
   * Log Schema configuration
   */
  var LogSchemaConf: huemul_DataLakeSchemaConf = new  huemul_DataLakeSchemaConf()
  
  
  /***
   * FieldName for N° Rows in control line
   */
  var LogNumRows_FieldName: String = ""
  
  //FROM 2.4 
  /***
   * character for row delimited in PDF files
   */
  var rowDelimiterForPDF: String = "\\n"
  
  
  private var use_year: Integer = _
  def getuse_year: Integer = {return use_year}
  private var use_month: Integer = _
  def getuse_month: Integer = {return use_month}
  private var use_day: Integer = _
  def getuse_day: Integer = {return use_day}
  private var use_hour: Integer = _
  def getuse_hour: Integer = {return use_hour}
  private var use_minute: Integer = _
  def getuse_minute: Integer = {return use_minute}
  private var use_second: Integer = _
  def getuse_second: Integer = {return use_second}
  private var use_params: String = ""
  def getuse_params: String = {return use_params}
  
  def SetParamsInUse(ano: Integer, mes: Integer, dia: Integer, hora: Integer, min: Integer, seg: Integer, AdditionalParams: String){
    use_year = ano
    use_month = mes
    use_day = dia
    use_hour = hora
    use_minute = min
    use_second = seg
    use_params = AdditionalParams
  }
  
  
  def GetFullNameWithPath() : String = {
    return GetPath(GlobalPath) + LocalPath + FileName
  }
  
  
  def GetDataBase(Division: ArrayBuffer[huemul_KeyValuePath]): String = {
    return huemulBigDataGov.GlobalSettings.GetDataBase(huemulBigDataGov, Division)  
  }
  
  def GetDataBase(Division: ArrayBuffer[huemul_KeyValuePath], ManualEnvironment: String): String = {
    return huemulBigDataGov.GlobalSettings.GetDataBase(huemulBigDataGov, Division, ManualEnvironment)  
  }
  
  def GetPath(Division: ArrayBuffer[huemul_KeyValuePath]): String = {
    return huemulBigDataGov.GlobalSettings.GetPath(huemulBigDataGov, Division)  
  }
  
  def GetPath(Division: ArrayBuffer[huemul_KeyValuePath], ManualEnvironment: String): String = {
    return huemulBigDataGov.GlobalSettings.GetPath(huemulBigDataGov, Division, ManualEnvironment)  
  }
  
}
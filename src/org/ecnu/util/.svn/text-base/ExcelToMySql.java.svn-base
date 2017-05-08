package org.ecnu.util;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.ecnu.orm.Wares;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

public class ExcelToMySql {
	
   
    public static ArrayList<Wares> getWares() {
    	//获取Excel文档的路径
    	String filePath = "C://Wares.xls";
    	ArrayList <Wares> al=new ArrayList <Wares>();
    	
          try {
                // 创建对Excel工作簿文件的引用
                HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(filePath));
                // 在Excel文档中，第一张工作表的缺省索引是0
                // 其语句为：HSSFSheet sheet = workbook.getSheetAt(0);
                HSSFSheet sheet = wookbook.getSheet("Sheet1");
                //获取到Excel文件中的所有行数
                int rows = sheet.getPhysicalNumberOfRows();
                //遍历行
                for (int i = 1; i < rows; i++) {//从1开始，略去表头
                      // 读取左上端单元格
                      HSSFRow row = sheet.getRow(i);
                      // 行不为空
                      if (row != null) {
                            //获取到Excel文件中的所有的列
                            int cells = row.getPhysicalNumberOfCells();
                            String value = "";     
                            //遍历列
                            for (int j = 0; j < cells; j++) {
                                  //获取到列的值
                                  HSSFCell cell = row.getCell(j);
                                  if (cell != null) {
                                        switch (cell.getCellType()) {
                                              case HSSFCell.CELL_TYPE_FORMULA:
                                              break;
                                              case HSSFCell.CELL_TYPE_NUMERIC:
                                                    value += cell.getNumericCellValue() + ",";
                                              break;  
                                              case HSSFCell.CELL_TYPE_STRING:
                                                    value += cell.getStringCellValue() + ",";
                                              break;
                                              default:
                                                    value += "0";
                                              break;
                                  }
                            }      
                      }
                      // 将数据插入到mysql数据库中
                      String[] val = value.split(",");
                      
                      Wares w=new Wares();
                      
                      w.setWareCode(val[0]);
                      w.setWareName(val[1]);
                     // System.out.println("MMMMMMMMMMMMMMMMMM :"+w.getWareCode());
                     //System.out.println(w.getWareName());
                      al.add(w);
                    
                }
               
           }
    } catch (FileNotFoundException e) {
          e.printStackTrace();
    } catch (IOException e) {
          e.printStackTrace();
    }
          return al;
 }
}
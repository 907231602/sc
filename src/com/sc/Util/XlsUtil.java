package com.sc.Util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.sc.dao.courseDao;
  
/** 
 * xls工具类 
 *  
 * @author hjn 
 *  
 */  
public class XlsUtil { 
	
	private static courseDao coursedao;
      
   
	
	
	public static courseDao getCoursedao() {
		return coursedao;
	}

	public static void setCoursedao(courseDao coursedao) {
		XlsUtil.coursedao = coursedao;
	}

	public static void read(String filePath) throws IOException {  
        String fileType = filePath.substring(filePath.lastIndexOf(".") + 1, filePath.length());  
        InputStream stream = new FileInputStream(filePath);  
        Workbook wb = null;  
        if (fileType.equals("xls")) {  
            wb = new HSSFWorkbook(stream);  
        } else if (fileType.equals("xlsx")) {  
            wb = new XSSFWorkbook(stream);  
        } else {  
            System.out.println("您输入的excel格式不正确");  
        }  
        Sheet sheet1 = wb.getSheetAt(0);  
        for (Row row : sheet1) {  
            for (Cell cell : row) {  
                System.out.print(cell.getStringCellValue() + "  ");  
            }  
            System.out.println();  
        }  
    }  
  
    public static boolean write(String outPath) throws Exception {  
        String fileType = outPath.substring(outPath.lastIndexOf(".") + 1, outPath.length());  
        System.out.println(fileType); 
        System.out.println("hello");
        // 创建工作文档对象  
        Workbook wb = null;  
        if (fileType.equals("xls")) {  
            wb = new HSSFWorkbook();  
        } else if (fileType.equals("xlsx")) {  
            wb = new XSSFWorkbook();  
        } else {  
            System.out.println("您的文档格式不正确！");  
            return false;  
        }  
        // 创建sheet对象  
        Sheet sheet1 = (Sheet) wb.createSheet("sheet1");  
        // 循环写入行数据  
        List<Student> dataset = new ArrayList<Student>(); 
        
      List list=  getCoursedao().selectAllcourse();
        System.out.println("");
        
        dataset.add(new Student(10000001, "张", 20, true, new Date()));  
        dataset.add(new Student(20000002, "李四", 24, false, new Date()));  
        dataset.add(new Student(30000003, "王五", 22, true, new Date()));  
        System.out.println("长度"+ dataset.size());  
        
        
        
        for (int i = 0; i <dataset.size(); i++) {  
            Row row = (Row) sheet1.createRow(i);  
            // 循环写入列数据 
            
            Cell cell = row.createCell(1); 
            cell.setCellValue("测试" + dataset.get(1).getAge()); 
            Cell cell2 = row.createCell(2); 
            cell2.setCellValue("测试" + dataset.get(0).getName()); 
          /*  for (int j = 0; j < 5; j++) {  
                Cell cell = row.createCell(j);  
                cell.setCellValue("测试" + dataset.get(1).getAge());  
                cell.setCellValue("测试" + dataset.get(2).getName());
            }  */
        }  
        // 创建文件流  
        OutputStream stream = new FileOutputStream(outPath);  
        // 写入数据  
        wb.write(stream);  
        // 关闭文件流  
        stream.close();  
        return true;  
    }  
  
  
    public static void main(String[] args) {  
       try {  
            XlsUtil.write("D:" + File.separator + "out.xlsx");  
        } catch (Exception e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
       /* try {  
            XlsUtil.read("D:" + File.separator + "out.xlsx");  
        } catch (IOException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  */
    }  
}  
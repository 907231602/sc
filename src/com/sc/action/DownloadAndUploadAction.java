package com.sc.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sc.dao.DownloadAndUploadDao;

public class DownloadAndUploadAction extends ActionSupport {
	
	
	private DownloadAndUploadDao downloadAnduploaddao;
	
	    private String username;
	    
	    private String  downfilename;
	    
	    private String choosefileId;
	    
	    private String fileId;
	//这里用List来存放上传过来的文件，file同样指的是临时文件夹中的临时文件，而不是真正上传过来的文件
	    private List<File> file;
	    
	//这个List存放的是文件的名字，和List<File>中的文件相对应
	    private List<String> fileFileName;
	    
	    private List<String> fileContentType;

	    public String getChoosefileId() {
			return choosefileId;
		}

		public void setChoosefileId(String choosefileId) {
			this.choosefileId = choosefileId;
		}

		public String getDownfilename() {
			return downfilename;
		}

		public void setDownfilename(String downfilename) {
			this.downfilename = downfilename;
		}

		public String getFileId() {
			return fileId;
		}

		public void setFileId(String fileId) {
			this.fileId = fileId;
		}

		public DownloadAndUploadDao getDownloadAnduploaddao() {
			return downloadAnduploaddao;
		}

		public void setDownloadAnduploaddao(DownloadAndUploadDao downloadAnduploaddao) {
			this.downloadAnduploaddao = downloadAnduploaddao;
		}

		public String getUsername()
	    {
	        return username;
	    }

	    public void setUsername(String username)
	    {
	        this.username = username;
	    }

	    public List<File> getFile()
	    {
	        return file;
	    }

	    public void setFile(List<File> file)
	    {
	        this.file = file;
	    }

	    public List<String> getFileFileName()
	    {
	        return fileFileName;
	    }

	    public void setFileFileName(List<String> fileFileName)
	    {
	        this.fileFileName = fileFileName;
	    }

	    public List<String> getFileContentType()
	    {
	        return fileContentType;
	    }

	    public void setFileContentType(List<String> fileContentType)
	    {
	        this.fileContentType = fileContentType;
	    }
	
	
	
	 public InputStream getInputStream()throws Exception{  
         
	        return ServletActionContext.getServletContext().getResourceAsStream("/WEB-INF/upload/1.jpg");  
	          
	    }  
	 /**
	  * 
	      * @discription 在此输入一句话描述作用
	      * @author 北方民族大学/20142233       
	      * @created 2016年6月9日 上午11:19:38      
	      * @return
	      * @throws Exception     
	      * @see com.opensymphony.xwork2.ActionSupport#execute()
	  */
	    public String execute()throws Exception{  
	        return SUCCESS;  
	    }  
	    
	    
	    /**
	     * 上传
	     * @return
	     * @throws Exception
	     */
	    @SuppressWarnings("null")
		public String fileUpload2() throws Exception{
	    	String root = ServletActionContext.getServletContext().getRealPath("/upload");
	        for(int i = 0; i < file.size(); i++)
	        {
	        	System.out.println("file.get(i)"+file.get(i));
	            InputStream is = new FileInputStream(file.get(i));
	            System.out.println("fileFileName= "+i+" "+fileFileName.get(i));
	            getDownloadAnduploaddao().insertNewFileName(fileFileName.get(i).toString(),root,username);
	            
	            OutputStream os = new FileOutputStream(new File(root, fileFileName.get(i)));
	            
	            byte[] buffer = new byte[500];
	            
	            @SuppressWarnings("unused")
	            int length = 0;
	            
	            while(-1 != (length = is.read(buffer, 0, buffer.length)))
	            {
	                os.write(buffer);
	            }
	            os.close();
	            is.close();
	        }
	       List listfile= getDownloadAnduploaddao().getAllFileInfo();
	        ActionContext.getContext().put("listfile", listfile);
	        
	        return "listfile";
	    }
 	    
	    
	    /**
	     * 下载
	     * @return
	     * @throws Exception
	     */
	    public InputStream getDownloadFile() throws Exception{
	    	String id=getFileId();
	    	System.out.println("id="+id);
	    	this.downfilename=getDownloadAnduploaddao().getfileNameByid(Integer.parseInt(id));
	    	System.out.println("this.downfilename+"+this.downfilename);
	    	
	    	 //解解乱码  
	    //String	downfilenames = new String(this.downfilename.getBytes("ISO8859-1"), "utf-8"); 
	    	
	    	String filePath="/upload/"+this.downfilename;
	    	System.out.println("filePath"+filePath);
	    	//ActionContext.getContext().put("downfilename", downfilename);
	    	//return ServletActionContext.getServletContext().getResourceAsStream("/upload/linux.txt");
	    	InputStream in=  ServletActionContext.getServletContext().getResourceAsStream(filePath);
	    	System.out.println(in);
	    	return  in;  
	    }
	    
	    public String findAllUploadedFile(){
	    	
			  List listFile= getDownloadAnduploaddao().getAllFileInfo();
			  ActionContext.getContext().put("listUploadedFiles", listFile);
  		    return "listUploadedFiles";
	    	
	    	
	    }
	    
	    public String deleteFileById(){
	    	String id=getChoosefileId();
	    	
	    	
	    	System.out.println("id="+id);
	    	this.downfilename=getDownloadAnduploaddao().getfileNameByid(Integer.parseInt(id));
	    	System.out.println("this.downfilename+"+this.downfilename);
	    	
	    	
	    	getDownloadAnduploaddao().deletefileById(id);
	    	
	    	
	    	//Struts2里面的写法是这样的。
	    	//相对路径你应该知道到。
	    	String relativePath = "/upload/";
	    	String absolutePath = ServletActionContext.getServletContext().getRealPath(relativePath);
	    	//取出文件的绝对路径，然后用File方法删除相应文件。
	    	System.out.println("absolutePath"+absolutePath+"/"+this.downfilename);
	    	File file = new File(absolutePath+"/"+this.downfilename);
	    	if (file.exists()) {
	    		System.out.println("删除文件");
	    	    file.delete();
	    	    
	    	}
	    	
	    	
	    	
	    	  List listFile= getDownloadAnduploaddao().getAllFileInfo();
			  ActionContext.getContext().put("listUploadedFiles", listFile);
			  ActionContext.getContext().put("deleteOk", "OK");
			return "listUploadedFiles";
	    	
	    }
	    
	    
}

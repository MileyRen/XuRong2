package org.ecnu.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.ecnu.orm.ChannelHis;
import org.ecnu.orm.ChannelInfo;
import org.ecnu.orm.Wares;
import org.ecnu.service.WaresService;
import org.ecnu.util.ExcelToMySql;
import org.ecnu.util.TestPinYin4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("waresController")
public class WaresController {
	@Autowired
	private WaresService ws;
	
	@RequestMapping("/to_ware_page_3")
	public String towaresPage() {
		return "WareSearch";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("do_ware_search_3")
	public ModelAndView searchProducts(@RequestParam("PageNo")int pageNo, Wares pgi) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("WareSearch");

		List<Wares> wlist = new ArrayList<Wares>();
		wlist = (List<Wares>) ws.searchByLike(pgi, pageNo);
		mav.addObject("wareslist", wlist);
		long rows = ws.countRowsByLike(pgi);
		//System.out.println("rows:  "+rows);
		//long length=((rows%10 )!=0 )?(rows/10+1):(rows/10);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		//System.out.println("length:  "+length);
		
		mav.addObject("hpgi", pgi);
		mav.addObject("PageNo", pageNo);
		System.out.println(pageNo);
		return mav;
	}
	
	@RequestMapping("do_ware_view_3")
	public ModelAndView viewProduct(@RequestParam("Id")long wid) {
		//&brandId=${list.brandInfo.brandId}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("WareView");
		mav.addObject("pinfo", ws.read(wid));
		return mav;
	}
	
	@RequestMapping("to_ware_edit_2")
	public ModelAndView editProduct(@RequestParam("Id")long wid) {
		//&brandId=${list.brandInfo.brandId}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("WareEdit");
		mav.addObject("pinfo", ws.read(wid));
		return mav;
	}
	
	@RequestMapping("do_ware_update_0")
	public ModelAndView updateProduct(Wares pgi) {
		//&brandId=${list.brandInfo.brandId}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("WareSearch");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date now = new Date();
		pgi.setLastTime(sdf.format(now));
		pgi.setWareSimpleCode(TestPinYin4j.getPinYinHeadChar(pgi.getWareName()));
		ws.update(pgi);
		return mav;
	}
	
	
	@RequestMapping("do_ware_search2_3")
	public ModelAndView searchGoods(@RequestParam("PageNo")int pageNo,@RequestParam("pname")String wareName) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChooseProduct");
		
		Wares wares = new Wares();
		wares.setWareName(wareName);
		
		mav.addObject("wareslist", ws.search(wares, pageNo));
		mav.addObject("pname", wareName);
		mav.addObject("PageNo", pageNo);
		return mav;
	}
	
	@RequestMapping("/do_ware_view2_3")
	public ModelAndView viewGoods(@RequestParam("id")long id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ViewProduct");
		
		Wares wares = new Wares();
		wares.setWareId(id);

		mav.addObject("waresinfo", ws.search(wares, 0).get(0));
		return mav;
	}
	
	@RequestMapping("/to_ware_select_3")
	public ModelAndView tosearchProductforChannel(@RequestParam("pcid")String pchannelid){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("SelectProduct");
		
		mav.addObject("id",pchannelid);
		return mav;
	}
	
	@RequestMapping("/to_ware_add_1")
	public String toAddProduct(){
		return "WareAdd";	
	}
	
	@RequestMapping("/do_ware_add_1")
	public String doAddProduct(Wares w)
	{
		
		w.setWareSimpleCode(TestPinYin4j.getPinYinHeadChar(w.getWareName()));
		//获得操作时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date now = new Date();
		w.setLastTime(sdf.format(now));
		w.setWareStatus("1");
		ws.insert(w);
		return "WareAdd";
	
	}
	
	@RequestMapping("/do_ware_importview_1")
	public ModelAndView doImportProduct(@RequestParam("file") String file)
	{
		ModelAndView mav = new ModelAndView();
//		
//		if(!file.contains("/")||file.split(".")[file.split(".").length-1].compareToIgnoreCase("xls")!=0){
//			mav.setViewName("WareImport");
//			mav.addObject("fileinfo","请使用IE并上传Office2003的.xls文件");
//			return mav;
//			}
		
		System.out.println("filePath:"+file);
		List<Wares> wlist = new ArrayList<Wares>();
		try {
            // 创建对Excel工作簿文件的引用
            HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(file));
            HSSFSheet sheet = workbook.getSheetAt(0);
            int rows = sheet.getPhysicalNumberOfRows();
            for (int i = 1; i < rows; i++) {//从1开始，略去表头
        		Wares w=new Wares();
        		// 读取左上端单元格
            	HSSFRow row = sheet.getRow(i);
                // 行不为空
                if (row != null) {   
	                w.setWareCode(getCellFormatValue(row.getCell(0)));
	                w.setWareName(getCellFormatValue(row.getCell(1)));
//	                w.setWareSimpleCode(TestPinYin4j.getPinYinHeadChar(getCellFormatValue(row.getCell(1))));
	                w.setWareNorm(getCellFormatValue(row.getCell(2)));
                }
              wlist.add(w);
            }
		} catch (FileNotFoundException e) {
		      e.printStackTrace();
		} catch (IOException e) {
		      e.printStackTrace();
		}
		for(int k=0; k<wlist.size(); k++){
			System.out.println(wlist.get(k).getWareCode());
		}
		mav.setViewName("WareImportView");
		mav.addObject("wareslist",wlist);
		return mav;
	}
	
	@RequestMapping("/do_ware_import_1")
	public String stockUpdateByIncrement(@RequestParam("wareCode") List<String> wcs, @RequestParam("wareName") List<String> wnames, @RequestParam("wareNorm")List<String> wnorms){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date now = new Date();
		
		for(int i =0; i<wcs.size(); i++){
			Wares w=new Wares();
			w.setLastTime(sdf.format(now));
			w.setWareStatus("1");
			w.setWareCode(wcs.get(i));
			w.setWareName(wnames.get(i));
			w.setWareSimpleCode(TestPinYin4j.getPinYinHeadChar(wnames.get(i)));
			w.setWareNorm(wnorms.get(i));
			if(wnorms.get(i)!=""){//规格不为空
				String wu = String.valueOf(wnorms.get(i).split("/")[0].charAt(wnorms.get(i).split("/")[0].length()-1));
				w.setWareUnit(wu);
				}
			ws.insert(w);
		}
		return "WareSearch";
	}
	
	//use JSON
	/**
	 * 
	 * @param model
	 * @return
	 */	
		@RequestMapping(value="/do_ware_find_3", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, String> wareFind(@RequestBody Map<String, String> model)
		{
			Map<String, String> map = new HashMap<String, String>(1);  
			Wares w = new Wares();
			w.setWareName(model.get("wareName"));
			if(ws.findWareByWareName(w)<=0)
			{
				map.put("success", "true");  
			}
			else 
			{
				map.put("success", "false");  
			}
			return map;
		}
	
		private String getCellFormatValue(HSSFCell cell) {
		    String cellvalue = "";
		    if (cell != null) {
		        // 判断当前Cell的Type
		        switch (cell.getCellType()) {
		        // 如果当前Cell的Type为NUMERIC
		        case HSSFCell.CELL_TYPE_NUMERIC:
		        case HSSFCell.CELL_TYPE_FORMULA: {
		            // 判断当前的cell是否为Date
		            if (HSSFDateUtil.isCellDateFormatted(cell)) {
		                // 如果是Date类型则，转化为Data格式
		                
		                //方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
		                //cellvalue = cell.getDateCellValue().toLocaleString();
		                
		                //方法2：这样子的data格式是不带带时分秒的：2011-10-12
		                Date date = cell.getDateCellValue();
		                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		                cellvalue = sdf.format(date);
		                
		            }
		            // 如果是纯数字
		            else {
		                // 取得当前Cell的数值
		                cellvalue = String.valueOf(cell.getNumericCellValue());
		            }
		            break;
		        }
		        // 如果当前Cell的Type为STRIN
		        case HSSFCell.CELL_TYPE_STRING:
		            // 取得当前的Cell字符串
		            cellvalue = cell.getRichStringCellValue().getString();
		            break;
		        // 默认的Cell值
		        default:
		            cellvalue = " ";
		        }
		    } else {
		        cellvalue = "";
		    }
		    return cellvalue;

		}
}


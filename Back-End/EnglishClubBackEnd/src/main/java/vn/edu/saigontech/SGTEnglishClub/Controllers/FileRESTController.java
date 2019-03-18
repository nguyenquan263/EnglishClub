package vn.edu.saigontech.SGTEnglishClub.Controllers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import vn.edu.saigontech.SGTEnglishClub.DAOs.FileDAO;
import vn.edu.saigontech.SGTEnglishClub.DAOs.MaterialDAO;
import vn.edu.saigontech.SGTEnglishClub.Models.File;
import vn.edu.saigontech.SGTEnglishClub.Models.Material;
import vn.edu.saigontech.SGTEnglishClub.Responses.CustomResponseEntity;

@RestController
public class FileRESTController {

	@Autowired
	private FileDAO fileDao;
	@Autowired
	private MaterialDAO eMaDAO;

	@RequestMapping(value = "/file", method = RequestMethod.GET)
	public CustomResponseEntity getAllFile() {
		return fileDao.getAllFile();
	}

	@RequestMapping(value = "/file/{id}", method = RequestMethod.GET)
	public CustomResponseEntity getFileByID(@PathVariable int id) {
		return fileDao.getFileByID(id);
	}

	@RequestMapping(value = "/file/material/{id}", method = RequestMethod.GET)
	public CustomResponseEntity getFileByMaterialID(@PathVariable int id) {
		return fileDao.getFileByMaterialID(id);
	}

	@RequestMapping(value = "/file/{fileStr}", method = RequestMethod.GET)
	public CustomResponseEntity getFileByFileName(@PathVariable String fileStr) {
		return fileDao.getFileByNameFile(fileStr);
	}

	@RequestMapping(value = "/manage/file", method = RequestMethod.POST)
	public CustomResponseEntity addFile(@RequestParam("link") String link, @RequestParam("materialID") int materialID,
			@RequestParam("status") boolean status, HttpServletRequest req) {
		Material targetMaterial = (Material) eMaDAO.getMaterialByID(materialID).getData();
		File targetFile = new File(targetMaterial, link, status);
		return fileDao.addFile(targetFile);

	}

	@RequestMapping(value = "/manage/file/material/{id}", method = RequestMethod.GET)
	public CustomResponseEntity getFileByMaterialIDAdmin(@PathVariable int id) {
		return fileDao.getFileByMaterialIDAdmin(id);
	}

	@RequestMapping(value = "/manage/file/{id}", method = RequestMethod.DELETE)
	public CustomResponseEntity deleteFile(@PathVariable int id, HttpServletRequest req) {
		return fileDao.deleteFile(id, req);
	}
}

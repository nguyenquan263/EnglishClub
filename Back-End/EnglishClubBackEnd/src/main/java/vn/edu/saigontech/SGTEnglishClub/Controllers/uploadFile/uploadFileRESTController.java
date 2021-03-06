package vn.edu.saigontech.SGTEnglishClub.Controllers.uploadFile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import vn.edu.saigontech.SGTEnglishClub.Responses.CustomResponseEntity;
import vn.edu.saigontech.SGTEnglishClub.Utils.fileUploadUtils;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;

import java.util.stream.Collectors;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@EnableWebMvc
public class uploadFileRESTController {
	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public ResponseEntity<?> uploadFileMulti(HttpServletRequest req,
			@RequestParam("files") MultipartFile[] uploadfiles) {
		// Get file name
		String uploadedFileName = Arrays.stream(uploadfiles).map(x -> x.getOriginalFilename())
				.filter(x -> !StringUtils.isEmpty(x)).collect(Collectors.joining(" , "));

		String res = uploadedFileName;

		if (StringUtils.isEmpty(uploadedFileName)) {
			return new ResponseEntity("please select a file!", HttpStatus.OK);
		}

		try {

			res = fileUploadUtils.saveUploadedFiles(Arrays.asList(uploadfiles),
					req.getServletContext().getRealPath("/images/"));

		} catch (IOException e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return new ResponseEntity("Successfully uploaded - " + res, HttpStatus.OK);

	}

	@RequestMapping(value = "/getImage/{fileName:.+}", method = RequestMethod.GET)

	public void showImage(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("fileName") String fileName) throws Exception {

		System.out.println(fileName);
		ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();

		try {
			System.out.println(request.getServletContext().getRealPath("/images/")+ File.separator + fileName);

			BufferedImage image = ImageIO
					.read(new File(request.getServletContext().getRealPath("/images/")  + File.separator +fileName));
			ImageIO.write(image, "jpeg", jpegOutputStream);
		} catch (IllegalArgumentException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}

		byte[] imgByte = jpegOutputStream.toByteArray();

		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		ServletOutputStream responseOutputStream = response.getOutputStream();
		responseOutputStream.write(imgByte);
		responseOutputStream.flush();
		responseOutputStream.close();
	}
	
	@RequestMapping(value = "/getFile/{fileName:.+}", method = RequestMethod.GET)

	public void downloadFile(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("fileName") String fileName) throws Exception {

        String dataDirectory = request.getServletContext().getRealPath("/images/");
        Path file = Paths.get(dataDirectory, fileName);
        if (Files.exists(file))
        {
            response.setContentType("application/pdf");
            response.addHeader("Content-Disposition", "attachment; filename="+fileName);
            try
            {
                Files.copy(file, response.getOutputStream());
                response.getOutputStream().flush();
            }
            catch (IOException ex) {
                ex.printStackTrace();
            }
        }
	}
	
	@RequestMapping(value = "/deleteFile/{fileName:.+}", method = RequestMethod.DELETE)
	public CustomResponseEntity deleteFile(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("fileName") String fileName) {
		boolean res = fileUploadUtils.deleteUploadFile(fileName, request.getServletContext().getRealPath("/images/"));
		if (res == true) {
			return CustomResponseEntity.getOKResponse("Delete "+fileName+" successfully!", null);
		} else {
			return CustomResponseEntity.getErrorRemovingResponse();
		}
	}
}

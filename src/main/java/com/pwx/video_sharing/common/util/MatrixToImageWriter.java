package com.pwx.video_sharing.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Hashtable;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.pwx.video_sharing.dictionary.DicSingle;

public class MatrixToImageWriter {

    private static final int BLACK = 0xFF000000;
    private static final int WHITE = 0xFFFFFFFF;
    
    /**
     * 数据字典
     */
    public static DicSingle dic = DicSingle.getInstance();

    private MatrixToImageWriter(){
    }

    public static BufferedImage toBufferedImage(BitMatrix matrix) {
        int width = matrix.getWidth();
        int height = matrix.getHeight();
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
            }
        }
        return image;
    }

    public static void writeToFile(BitMatrix matrix, String format, File file) throws IOException {
        BufferedImage image = toBufferedImage(matrix);
        if (!ImageIO.write(image, format, file)) {
            throw new IOException("Could not write an image of format " + format + " to " + file);
        }
    }
    
    public static void writeToStream(BitMatrix matrix, String format, OutputStream stream) throws IOException {
        BufferedImage image = toBufferedImage(matrix);
        if (!ImageIO.write(image, format, stream)) {
            throw new IOException("Could not write an image of format " + format);
        }
    }
    
    public static String imgCode(String fileName,int width,int height,String text){
        try {
            String picScr = dic.getText("picPath", "picSrc");
            String ModuleFileName = dic.getText("picPath", "coupons");
            String fileUrl=picScr+"/"+SessionUtil.getUserName()+ "/" + ModuleFileName;
            //String fileUrlName = "F:/images/" + SessionUtil.getUserName() + "/"  + fileName;
            String fileUrlName = fileUrl + "/"  + fileName;
            File checkFile = new File(fileUrlName);
            //验证文件是否存在,存在就删除
            if(checkFile.exists()){
                checkFile.delete();
            }
            
            //String fileUrl = "F:/images/" + SessionUtil.getUserName() + "/";
            
            File userNameFile = new File(picScr+"/"+SessionUtil.getUserName());
            //验证文件夹是否存在,不存在就创建
            if  (!userNameFile.exists()  && !userNameFile.isDirectory())      
            {       
                userNameFile.mkdirs();    
            }
            
            
            File checkFileUrl = new File(fileUrl);
            //验证文件夹是否存在,不存在就创建
            if  (!checkFileUrl.exists()  && !checkFileUrl.isDirectory())      
            {       
                checkFileUrl.mkdirs();    
            } 
            
            //二维码的图片格式 
            String format = "jpg"; 
            
            Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>(); 
            //内容所使用编码 
            hints.put(EncodeHintType.CHARACTER_SET, "utf-8"); 
            BitMatrix bitMatrix = new MultiFormatWriter().encode(text, 
                    BarcodeFormat.QR_CODE, width, height, hints); 
            //生成二维码 
            File outputFile = new File(fileUrlName); 
            MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);
            return outputFile.getCanonicalPath();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

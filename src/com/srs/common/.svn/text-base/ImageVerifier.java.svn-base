package com.srs.common;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

/**
 * 图片验证机
 * @author Bottle
 * @date 2013-4-24 上午11:42:24
 */
public class ImageVerifier
{
	private ImageVerifier()
	{
	}

	public static final String getImageString(int i, String imageStyle, OutputStream outputstream)
	{
		String s = "";
		try
		{
			BufferedImage bufferedimage = new BufferedImage(66, 20, 4);
			Graphics2D G2D = bufferedimage.createGraphics();
			int j = BACK_COLOR[randomInt(0, BACK_COLOR.length)];
			G2D.setColor(new Color(j));
			G2D.setBackground(new Color(j));
			G2D.fillRect(0, 0, 66, 20);
			G2D.setColor(new Color(0x92c3e5));
			G2D.drawRect(0, 0, 65, 19);
			for (int k = 0; k < i; k++)
			{
				s = (new StringBuilder()).append(s).append(mapTable[(int) ((double) mapTable.length * Math.random())]).toString();
			}
			for (int l = 0; l < s.length(); l++)
			{
				String s1 = s.substring(l, l + 1);
				Color color = new Color(CHAR_COLOR[randomInt(0, CHAR_COLOR.length)]);
				G2D.setColor(color);
				G2D.setFont(new Font(FontStyle, 0, 16));
				int l1 = l * 15 + 4;
				int i2 = randomInt(13, 17);
				G2D.drawString(s1, l1, i2);
			}
			for (int i1 = 1; i1 <= 10; i1++)
			{
				int j1 = randomInt(2, 65);
				int k1 = randomInt(2, 19);
				Color color1 = new Color(CHAR_COLOR[randomInt(0, CHAR_COLOR.length)]);
				G2D.setColor(color1);
				G2D.drawOval(j1, k1, 1, 1);
			}
			G2D.dispose();
			bufferedimage.flush();
			ImageIO.write(bufferedimage, imageStyle, outputstream);
			outputstream.flush();
			outputstream.close();
		} catch (Exception exception)
		{
			return exception.toString();
		}
		return s;
	}

	private static int randomInt(int i, int j)
	{
		Random random = new Random();
		return i + random.nextInt(j - i);
	}
//	private static final int Y_pos = 10;
//	private static final int X_pos = 15;
//	private static final int width = 66;
//	private static final int height = 20;
//	private static final int FONT_SIZE = 16;
	private static final int BACK_COLOR[] = { 0xb3d5ed, 0xc1ead5 };
	private static final int CHAR_COLOR[] = { 25327, 0x976824, 0x308b5d };
//	private static final int LINE_COLOR[] = { 21968, 0xb46900 };
	private static final String FontStyle = "Geneva, Verdana, Arial, Helvetica";
	private static final char mapTable[] = { '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'd', 'h', 'n', 'x', 's', 't', 'e' };
}

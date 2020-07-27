// This macro processes all the images in a folder and any subfolders.

/*  extension = ".png";
  dir1 = getDirectory("E:\Akash\Input_images ");
  dir2 = getDirectory("E:\Akash\Output_images ");
  setBatchMode(true);
  n = 0;
  processFolder(dir1);

  function processFolder(dir1) {
     list = getFileList(dir1);
     for (i=0; i<list.length; i++) {
          if (endsWith(list[i], "/"))
              processFolder(dir1+list[i]);
          else if (endsWith(list[i], extension))
             processImage(dir1, list[i]);
      }
  }

  function processImage(dir1, name) {
     open(dir1+name); 
     print(n++, name);
 */
 dir = getDirectory("F:/Output images/Output_images'_9_noise4");
 num_cycles=100;
 num_img= 36;
 
 function d2s(number, width, character) {
        number = toString(number); // force string
        character = toString(character);
        for (len = lengthOf(number); len < width; len++)
                number = character + number;
        return number;
 }

for(i=1;i<=num_cycles;i++) {
	for(j=1;j<=num_img;j++) {

		open("E:/Akash/Input_images'_9_noise4/im"+ d2s(i,6,0) + "_" + d2s(j,2,0) + ".png");

makeRectangle(0, 358, 2048, 1324);
//makeRectangle(249, 387, 1554, 1134);
run("Crop");
id1 = getTitle();
run("Split Channels");

selectWindow(id1 + " (blue)");
close();

selectWindow(id1 + " (red)");
close();

selectWindow(id1 + " (green)"); 
     // add code here to analyze or process the image
//run("Sharpen");
run("Subtract Background...", "rolling=60 light");

setThreshold(0, 160);
setOption("BlackBackground", true);
run("Convert to Mask");

//run("Make Binary");
//run("Invert");
//setForegroundColor(255, 255, 255);
//run("Fill Holes");
//run("Invert");
run("Watershed");
saveAs("PNG", "F:/Output images/Output_images'_9_noise4\\im"+ d2s(i,6,0) + "_" + d2s(j,2,0) + ".png");
//run("Save", "save=G:\\Output_images'_9_noise4\\im"+ d2s(i,6,0) + "_" + d2s(j,2,0) + ".png");
close();
  }
}

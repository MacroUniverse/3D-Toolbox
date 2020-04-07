%用于从视频中提取两张相片

videoFReader = vision.VideoFileReader('VID_20131106_160753.avi');
videoPlayer = vision.VideoPlayer;

for jj=1:25
    for ii=1:10
      videoFrame = step(videoFReader);
    end
end
I1=videoFrame;
for ii=1:10
  videoFrame = step(videoFReader);
end
I2=videoFrame;

release(videoPlayer);
release(videoFReader);
/**
 * Multi-line comments for documentation.
 */

package;

import ffmpeg.Error.FFmpegError;
import ffmpeg.Media;
import ffmpeg.openfl.OpenFLBitmapVideo;
import ffmpeg.openfl.OpenFLSound;
import ffmpeg.Version;
import openfl.display.Bitmap;
import openfl.display.Sprite;
<<<<<<< Updated upstream
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import sys.db.ResultSet;
=======
import ffmpeg.Error.FFmpegErrorType;
import ffmpeg.Version;
import ffmpeg.Media;
>>>>>>> Stashed changes

class Main extends Sprite {
  public function new() {
    super();

    printVersionInfo();

    loadVideo();

    stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);

    // quit();
  }

  public function printVersionInfo():Void {
    trace('Welcome to extension-ffmpeg.');
    trace('libavcodec version: ' + Version.getLibavcodecVersion());
    trace('libavformat version: ' + Version.getLibavformatVersion());
    trace('libavutil version: ' + Version.getLibavutilVersion());
    trace('libavfilter version: ' + Version.getLibavfilterVersion());
    trace('libswresample version: ' + Version.getLibswresampleVersion());
    trace('libswscale version: ' + Version.getLibswscaleVersion());
    trace('avcodec_configuration: ' + Version.getAvcodecConfiguration());
    trace('avcodec_license: ' + Version.getAvcodecLicense());

    trace('===========================================================');
  }

  var video:OpenFLBitmapVideo;
  var sound:OpenFLSound;

  public function loadVideo():Void {
    // var filePath:String = "https://upload.wikimedia.org/wikipedia/commons/c/c5/Limes.webm";
    // var filePath:String = "file:assets/earth.mp4";
    // var filePath:String = "file:assets/Limes.webm";
    // var filePath:String = "file:assets/Limes.webm.srt";
    var filePath:String = "file:assets/stressCutscene.mp4";
    // var filePath:String = "http://ftp.itec.aau.at/datasets/DASHDataset2014/ElephantsDream/10sec/ElephantsDream_10s_onDemand_2014_05_09.mpd"
    // var filePath:String = "file:assets/nikki.gif";
    // var filePath:String = "file:assets/dancer1.webm";
    // var filePath:String = "file:assets/travolta.webm";
    // var filePath:String = "https://uploads.ungrounded.net/alternate/1528000/1528775_alternate_113347_r88.zip/assets/music/stressCutscene.mp4";

    trace('Loading video...');

    if (true) {
      video = new OpenFLBitmapVideo();
      video.open(filePath);
      addChild(video);
    } else {
      sound = new OpenFLSound();
      sound.open(filePath);
      sound.play();
    }

    var fps = new openfl.display.FPS(10, 10, 0x000000);
    var ram = new MemoryCounter(10, 50, 0x000000);
    addChild(fps);
    addChild(ram);
  }

  function onKeyPress(event:KeyboardEvent) {
    switch(event.keyCode) {
      case Keyboard.SPACE:
        trace('Playing video...');
        video.play();
      default:
        // do nothing
    }
  }

  public static function quit():Void {
    trace('Exiting...');
    Sys.exit(0);
  }
}

import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class AnalogTicksView extends WatchUi.WatchFace {
    var _devCenter;
    const _toRads = Math.PI / 180;
    const _doublePi = Math.PI * 2;

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        _devCenter = dc.getWidth() / 2;
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        dc.setColor(0, 0x202020);
        dc.clear();

        //drawHands1(dc, 208, 208, 190);
        //drawHands2(dc, 208, 208, 190);
        //dc.setColor(Graphics.COLOR_DK_RED, -1);
        //drawHands3(dc, 208, 208, 190);

        dc.setColor(Graphics.COLOR_LT_GRAY, -1);
        drawMarkers1(dc, 120, 120, 50);

        dc.setColor(Graphics.COLOR_GREEN, -1);
        drawMarkers2(dc, 300, 120, 50);

        dc.setColor(Graphics.COLOR_RED, -1);
        drawMarkers3(dc, 120, 300, 50);

        dc.setColor(Graphics.COLOR_PINK, -1);
        drawMarkers3(dc, 300, 300, 50);

        dc.setColor(Graphics.COLOR_PURPLE, -1);
        drawMarkers3(dc, 208, 208, 208);
        
        dc.setColor(Graphics.COLOR_BLUE, -1);
        dc.drawLine(0, _devCenter, _devCenter * 2, _devCenter);
        dc.drawLine(_devCenter, 0, _devCenter, _devCenter * 2);
    }

    // copilot w fix
    function drawHands1(dc, centerX, centerY, radius) {
        for (var s = 0; s < 60; s++) {
            var angle = s * 6 * _toRads;
            var x = centerX + radius * Math.sin(angle) + 0.5;
            var y = centerY - radius * Math.cos(angle);
            dc.drawLine(centerX, centerY, x, y);
        }
    }

    // seaside
    function drawHands2(dc, centerX, centerY, radius) {
        for (var s = 0; s < 60; s++) {
            var angle = (s * 6 + 270) * _toRads;
            var x = centerX + Math.cos(angle) * radius;
            var y = centerY + Math.sin(angle) * radius;
            dc.drawLine(centerX, centerY, x, y);
        }
    }

    // analog sdk example w fix
    function drawHands3(dc, centerX, centerY, radius) {
        for (var s = 0; s < 60; s++) {
            var angle = (s / 60.0) * _doublePi;
            var x = centerX + Math.sin(angle) * radius + 0.5;
            var y = centerY + Math.cos(angle) * -radius;
            dc.drawLine(centerX, centerY, x, y);
        }
    }

    // copilot w fix
    function drawMarkers1(dc, centerX, centerY, radius) {
        for (var s = 0; s < 60; s++) {
            var len = s % 5 == 0 ? 20 : 10;
            var angle = s * 6 * _toRads;
            var msin = Math.sin(angle);
            var mcos = Math.cos(angle);

            // outer point
            var x1 = centerX + radius * msin + 0.5; // copilot math
            var y1 = centerY - radius * mcos;

            // inner point
            var x2 = centerX + (radius - len) * msin + 0.5;
            var y2 = centerY - (radius - len) * mcos;

            dc.drawLine(x1, y1, x2, y2);
        }
    }

    // seaside
    function drawMarkers2(dc, centerX, centerY, radius) {
        for (var s = 0; s < 60; s++) {
            var len = s % 5 == 0 ? 20 : 10;
            var angle = (s * 6 + 270) * _toRads;
            var msin = Math.sin(angle);
            var mcos = Math.cos(angle);

            // outer point
            var x1 = centerX + mcos * radius;
            var y1 = centerY + msin * radius;

            // inner point
            var x2 = centerX + mcos * (radius - len);
            var y2 = centerY + msin * (radius - len);
     
           dc.drawLine(x1, y1, x2, y2);
        }
    }

    // analog sdk example w fix
    function drawMarkers3(dc, centerX, centerY, radius) {
        for (var s = 0; s < 60; s++) {
           var len = s % 5 == 0 ? 20 : 10;
           var angle = (s / 60.0) * _doublePi;
           var msin = Math.sin(angle);
           var mcos = Math.cos(angle);
            
           // outer point
           var x1 = centerX + msin * radius + 0.5;
           var y1 = centerY + mcos * -radius;

           // inner point
           var x2 = centerX + msin * (radius - len) + 0.5;
           var y2 = centerY + mcos * -(radius -len);
     
           dc.drawLine(x1, y1, x2, y2);
        }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}

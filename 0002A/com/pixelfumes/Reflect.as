class com.pixelfumes.Reflect
{
    var clip, bounds, mcBMP, reflectionBMP, updateInt;
    function Reflect(args)
    {
        var _loc2 = args.mc;
        var _loc17 = args.alpha;
        var _loc11 = args.ratio;
        var _loc7 = args.updateTime;
        var _loc12 = args.reflectionAlpha;
        var _loc6 = args.reflectionDropoff;
        var _loc4 = args.distance;
        clip = _loc2;
        var _loc13 = _loc2._height / _loc2._yscale * 100;
        var _loc10 = _loc2._width / _loc2._xscale * 100;
        bounds = new Object();
        bounds.width = _loc10;
        bounds.height = _loc13;
        var _loc5;
        if (_loc6 <= 0)
        {
            _loc5 = bounds.height;
        }
        else
        {
            _loc5 = bounds.height / _loc6;
        } // end else if
        mcBMP = new flash.display.BitmapData(bounds.width, bounds.height, true, 16777215);
        mcBMP.draw(_loc2);
        reflectionBMP = new flash.display.BitmapData(bounds.width, bounds.height, true, 16777215);
        reflectionBMP.draw(_loc2);
        _loc2.createEmptyMovieClip("reflection_mc", _loc2.getNextHighestDepth());
        _loc2.reflection_mc.attachBitmap(mcBMP, 1);
        _loc2.reflection_mc._yscale = -100;
        _loc2.reflection_mc._y = bounds.height * 2 + _loc4;
        _loc2.reflection_mc._alpha = _loc12;
        _loc2.createEmptyMovieClip("gradientMask_mc", _loc2.getNextHighestDepth());
        var _loc15 = "linear";
        var _loc14 = [16777215, 16777215];
        var _loc8 = [_loc17, 0];
        var _loc18 = [0, _loc11];
        var _loc9 = {matrixType: "box", x: 0, y: 0, w: bounds.width, h: _loc5, r: 1.570796E+000};
        var _loc16 = "pad";
        _loc2.gradientMask_mc.beginGradientFill(_loc15, _loc14, _loc8, _loc18, _loc9, _loc16);
        _loc2.gradientMask_mc.moveTo(0, 0);
        _loc2.gradientMask_mc.lineTo(0, bounds.height);
        _loc2.gradientMask_mc.lineTo(bounds.width, bounds.height);
        _loc2.gradientMask_mc.lineTo(bounds.width, 0);
        _loc2.gradientMask_mc.lineTo(0, 0);
        _loc2.gradientMask_mc.endFill();
        _loc2.gradientMask_mc._y = bounds.height + _loc4;
        _loc2.reflection_mc.cacheAsBitmap = true;
        _loc2.gradientMask_mc.cacheAsBitmap = true;
        _loc2.reflection_mc.setMask(_loc2.gradientMask_mc);
        if (_loc7 != null)
        {
            updateInt = setInterval(this, "update", _loc7, _loc2);
        } // end if
    } // End of the function
    function redrawBMP(mc)
    {
        mcBMP.dispose();
        mcBMP = new flash.display.BitmapData(bounds.width, bounds.height, true, 16777215);
        mcBMP.draw(mc);
    } // End of the function
    function update(mc)
    {
        mcBMP = new flash.display.BitmapData(bounds.width, bounds.height, true, 16777215);
        mcBMP.draw(mc);
        reflectionBMP.draw(mc);
        mc.reflection_mc.attachBitmap(mcBMP, 1);
    } // End of the function
    function setBounds(w, h)
    {
        bounds.width = w;
        bounds.height = h;
        reflectionBMP = new flash.display.BitmapData(bounds.width, bounds.height, true, 16777215);
        clip.gradientMask_mc._width = bounds.width;
        this.redrawBMP(clip);
    } // End of the function
    function destroy()
    {
        reflectionBMP.dispose();
        mcBMP.dispose();
        clearInterval(updateInt);
        removeMovieClip (clip.reflection_mc);
        removeMovieClip (clip.gradientMask_mc);
    } // End of the function
    var version = "3.0";
    var distance = 0;
} // End of Class

package cn.aneureka.library;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;

/**
 * Created by hiki on 2018/10/10.
 */

public class RNView extends View {

    Paint mPaint;

    public RNView(Context context) {
        super(context);
        this.init();
    }

    public RNView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        this.init();
    }

    private void init() {
        mPaint = new Paint();
        mPaint.setColor(Color.RED);
        mPaint.setStyle(Paint.Style.FILL);
        mPaint.setStrokeWidth(10F);
    }

    @Override
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawRect(0, 0, 400, 400, mPaint);
    }

}

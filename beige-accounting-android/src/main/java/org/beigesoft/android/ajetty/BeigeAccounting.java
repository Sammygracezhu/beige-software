package org.beigesoft.android.ajetty;

/*
 * Beigesoft ™
 *
 * Licensed under the Apache License, Version 2.0
 *
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 */

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.Map;

import android.app.Activity;
import android.content.Intent;
import android.content.res.AssetManager;
import android.os.Bundle;
import android.os.Build;
import android.os.AsyncTask;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import android.net.Uri;
import android.Manifest;
import android.content.pm.PackageManager;
import android.support.v4.content.ContextCompat;
import android.support.v4.app.ActivityCompat;

import org.beigesoft.ajetty.FactoryAppBeansEmbedded;
import org.beigesoft.android.app.ApplicationPlus;
import org.beigesoft.ajetty.BootStrapEmbedded;

/**
 * <p>Beige Accounting Jetty activity.</p>
 *
 * @author Yury Demidenko
 */
public class BeigeAccounting extends Activity implements OnClickListener {

  /**
   * <p>APP BASE dir.</p>
   **/
  public static final String APP_BASE = "webapp";

    /**
   * <p>APP BASE dir.</p>
   **/
  public static final int PERMISSIONS_REQUESTS = 2415;

  /**
   * <p>Flag to refresh UI.</p>
   **/
  private boolean isNeedsToRefresh;

  /**
   * <p>Button start.</p>
   **/
  private Button btnStart;

  /**
   * <p>Button stop.</p>
   **/
  private Button btnStop;

  /**
   * <p>Button start browser.</p>
   **/
  private Button btnStartBrowser;

  /**
   * <p>EditText Port.</p>
   **/
  private EditText etPort;

  /**
   * <p>TextView Status.</p>
   **/
  private TextView tvStatus;

  /**
   * <p>Application beans map reference to lock.</p>
   **/
  private Map<String, Object> beansMap;

  /**
   * <p>A-Jetty application beans factory.</p>
   **/
  private final FactoryAppBeansEmbedded jettyFactoryAppBeans =
    new FactoryAppBeansEmbedded();

  /**
   * <p>Called when the activity is first created or recreated.</p>
   * @param pSavedInstanceState Saved Instance State
   */
  @Override
  public final void onCreate(final Bundle pSavedInstanceState) {
    super.onCreate(pSavedInstanceState);
    setContentView(R.layout.ajetty);
    this.tvStatus = (TextView) findViewById(R.id.tvStatus);
    this.etPort = (EditText) findViewById(R.id.etPort);
    this.btnStart = (Button) findViewById(R.id.btnStart);
    this.btnStartBrowser = (Button) findViewById(R.id.btnStartBrowser);
    this.btnStartBrowser.setOnClickListener(this);
    this.btnStop = (Button) findViewById(R.id.btnStop);
    this.btnStart.setOnClickListener(this);
    this.btnStop.setOnClickListener(this);
    File jettyBase = new File(getFilesDir().getAbsolutePath()
     + File.separator + APP_BASE);
    if (!jettyBase.exists()) {
      boolean wasMistake = false;
      try {
        Toast.makeText(getApplicationContext(),
            "Try to create Beige Accounting directory...",
              Toast.LENGTH_SHORT).show();
        if (!jettyBase.mkdirs()) {
          wasMistake = true;
        }
        copyAssets(APP_BASE);
      } catch (Exception e) {
        wasMistake = true;
        e.printStackTrace();
      }
      if (wasMistake) {
        Toast.makeText(getApplicationContext(),
          "There was errors!",
            Toast.LENGTH_SHORT).show();
      } else {
        Toast.makeText(getApplicationContext(),
          "Beige Accounting directory was successfully created!",
            Toast.LENGTH_SHORT).show();
      }
    }
    ApplicationPlus appPlus = (ApplicationPlus) getApplicationContext();
    this.beansMap = appPlus.getBeansMap();
    if (ContextCompat.checkSelfPermission(this,
      Manifest.permission.WRITE_EXTERNAL_STORAGE)
        != PackageManager.PERMISSION_GRANTED) {
      ActivityCompat.requestPermissions(this, new String[]
        {Manifest.permission.READ_EXTERNAL_STORAGE,
          Manifest.permission.WRITE_EXTERNAL_STORAGE,
            Manifest.permission.INTERNET}, PERMISSIONS_REQUESTS);
    }
  }

  /**
   * <p>onClick handler.</p>
   * @param pTarget button
   */
  @Override
  public final void onClick(final View pTarget) {
    if (pTarget == this.btnStart) {
      this.btnStart.setEnabled(false);
      Toast.makeText(getApplicationContext(),
        "Sending request to start server, please wait", Toast.LENGTH_SHORT)
          .show();
      Intent intent = new Intent(this, JettyAccountingService.class);
      intent.setAction(JettyAccountingService.ACTION_START);
      startService(intent);
    } else if (pTarget == this.btnStop) {
      this.btnStop.setEnabled(false);
      Intent intent = new Intent(this, JettyAccountingService.class);
      intent.setAction(JettyAccountingService.ACTION_STOP);
      startService(intent);
    } else if (pTarget == this.btnStartBrowser) {
      startBrowser();
    }
  }

  /**
   * <p>onResume handler.</p>
   */
  @Override
  public final void onResume() {
    isNeedsToRefresh = true;
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
      new Refresher().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR,
        (Void[]) null);
    } else {
      new Refresher().execute((Void[]) null);
    }
    super.onResume();
  }

  /**
   * <p>onPause handler.</p>
   */
  @Override
  public final void onPause() {
    this.isNeedsToRefresh = false;
    try {
      Thread.sleep(1000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    super.onPause();
  }

  /**
   * <p>Start browser.</p>
   */
  private void startBrowser() {
    String url = "http://localhost:8080";
    Intent i = new Intent(Intent.ACTION_VIEW);
    i.setData(Uri.parse(url));
    startActivity(i);
  }

  /**
   * <p>Refresh view.</p>
   */
  private void refreshView() {
    synchronized (this.beansMap) {
      BootStrapEmbedded bootStrap = getOrInitBootStrap();
      if (bootStrap.getIsStarted()) {
        this.btnStart.setEnabled(false);
        this.btnStop.setEnabled(true);
        this.tvStatus.setText(getResources().getString(R.string.started));
        this.btnStartBrowser.setEnabled(true);
        String text = "http://localhost:"
          + String.valueOf(bootStrap.getPort());
        this.btnStartBrowser.setText(text);
      } else {
        this.btnStart.setEnabled(true);
        this.btnStop.setEnabled(false);
        this.tvStatus.setText(getResources().getString(R.string.stopped));
        this.btnStartBrowser.setEnabled(false);
        this.btnStartBrowser.setText("");
      }
      this.etPort.setText(String.valueOf(bootStrap.getPort()));
    }
  }

  /**
   * <p>Get Or Initialize BootStrapEmbedded.</p>
   * @return BootStrapEmbedded BootStrapEmbedded
   */
  private BootStrapEmbedded getOrInitBootStrap() {
    BootStrapEmbedded bootStrap = null;
    Object bootStrapO = this.beansMap
      .get(BootStrapEmbedded.class.getCanonicalName());
    if (bootStrapO != null) {
      bootStrap = (BootStrapEmbedded) bootStrapO;
    } else { // initialize:
      bootStrap = new BootStrapEmbedded();
      bootStrap.setWebAppPath(getFilesDir().getAbsolutePath()
        + File.separator + APP_BASE);
      try {
        bootStrap.setFactoryAppBeans(jettyFactoryAppBeans);
        bootStrap.createServer(false);
        bootStrap.getWebAppContext().setAttribute("android.content.Context",
          this);
      } catch (Exception e) {
        e.printStackTrace();
      }
      this.beansMap
        .put(BootStrapEmbedded.class.getCanonicalName(), bootStrap);
    }
    return bootStrap;
  }

  /**
   * <p>Recursively copy assets.</p>
   * @param pCurrDir current directory assets
   * @throws Exception an Exception
   */
  private void copyAssets(final String pCurrDir) throws Exception {
    AssetManager assetManager = getAssets();
    String[] files = assetManager.list(pCurrDir);
    for (String fileName : files) {
      String createdPath = getFilesDir().getAbsolutePath()
        + File.separator + pCurrDir + File.separator + fileName;
      if (!fileName.contains(".")) {
        File subdir = new File(createdPath);
        if (subdir.mkdirs()) {
          copyAssets(pCurrDir + File.separator + fileName);
        }
      } else {
        InputStream ins = null;
        OutputStream outs = null;
        try {
          ins = getAssets().open(pCurrDir + File.separator + fileName);
          outs = new BufferedOutputStream(
            new FileOutputStream(createdPath));
          byte[] data = new byte[1024];
          int count;
          while ((count = ins.read(data)) != -1) {
            outs.write(data, 0, count);
          }
          outs.flush();
        } finally {
          if (ins != null) {
            try {
              ins.close();
            } catch (Exception e2) {
              e2.printStackTrace();
            }
          }
          if (outs != null) {
            try {
              outs.close();
            } catch (Exception e3) {
              e3.printStackTrace();
            }
          }
        }
      }
    }
  }

  /**
   * <p>Refresher thread.</p>
   */
  private class Refresher extends AsyncTask<Void, Void, Void> {

    /**
     * <p>doInBackground check is need refresh.</p>
     */
    @Override
    protected final Void doInBackground(final Void... params) {
      while (BeigeAccounting.this.isNeedsToRefresh) {
        publishProgress((Void[]) null);
        try {
          Thread.sleep(2000);
        } catch (InterruptedException e) {
          e.printStackTrace();
        }
      }
      return null;
    }

    /**
     * <p>onProgressUpdate call refresh.</p>
     */
    @Override
    protected final void onProgressUpdate(final Void... values) {
      BeigeAccounting.this.refreshView();
      super.onProgressUpdate(values);
    }
  }
}

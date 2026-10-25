package naarad.client.tabhost;

import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.support.v4.app.Fragment;
import android.content.Context;
import android.view.ViewGroup;
import android.widget.Toast;
import android.view.Gravity;
import android.app.Activity;
import android.widget.Toast;
import android.view.Gravity;
import android.view.View;
import android.util.Log;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;


public abstract class NaaradAbstractFragment extends Fragment 
{
    private SharedPreferences prefs; 
    public Activity mActivity=null;        
    // client = new Socket("10.0.2.2", 1234); // connect to the server on local machine
    // client = new Socket("raspberrypi", 1234); // connect to the Naarad server
    public int getDefaultPort() 
    {
	return getPreference("serverPort",1234);
    }
    //final public String getDefaultServer() {return "10.0.2.2";}
    public String getDefaultServer() 
    {
	return getPreference("serverName","raspberrypi");
    }

    //
    // Hold a reference to the activity and use it in place of
    // getActivity().  This is required since getActivity() may return
    // NULL when the view is created from existing activity (either
    // via swipping or re-start of the app).
    //
    @Override public void onAttach(Activity activity) 
    {
        super.onAttach(activity);
	if (mActivity==null)
        mActivity = activity;
	//mActivity.setRequestedOrientation (ActivityInfo.SCREEN_ORIENTATION_USER_LANDSCAPE);
	mActivity.setRequestedOrientation (ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
    }

    public boolean recreateView(View v)
    {
	if (v != null)
	    {
		// Do not inflate the layout again.
		// The returned View of onCreateView will be added into the fragment.
		// However it is not allowed to be added twice even if the parent is same.
		// So we must remove root View (nView) from the existing parent view group
		// (it will be added back).
		((ViewGroup)v.getParent()).removeView(v);
		return true;
	    }
	else return false;
    }

    public void setPreference(String name, String value)
    {
	prefs = mActivity.getSharedPreferences("nSettings", Context.MODE_PRIVATE); 
	SharedPreferences.Editor editor = prefs.edit();
	editor.putString(name, value);  //or you can use putInt, putBoolean ... 
	//editor.apply();
	editor.commit();
    }
    public void setPreference(String name, int value)
    {
	prefs = mActivity.getSharedPreferences("nSettings", Context.MODE_PRIVATE); 
	SharedPreferences.Editor editor = prefs.edit();
	editor.putInt(name, value);  //or you can use putInt, putBoolean ... 
	//editor.apply();
	editor.commit();
    }
    public int getPreference(String name, int defValue)
    {
	prefs = mActivity.getSharedPreferences("nSettings", Context.MODE_PRIVATE);
	return prefs.getInt(name,defValue);
    }
    public String getPreference(String name, String defValue)
    {
	prefs = mActivity.getSharedPreferences("nSettings", Context.MODE_PRIVATE);
	return prefs.getString(name,defValue);
    }
    public void setServerName(String name)
    {
	setPreference("serverName",name);
	// prefs = mActivity.getSharedPreferences("nSettings", Context.MODE_PRIVATE); 
	// SharedPreferences.Editor editor = prefs.edit();
	// editor.putString("serverName", name);  //or you can use putInt, putBoolean ... 
	// //editor.apply();
	// editor.commit();
    }
    public String getServerName()    
    {
	prefs = mActivity.getSharedPreferences("nSettings", Context.MODE_PRIVATE);
	return prefs.getString("serverName",getDefaultServer());
    }


    public void setServerPort(int port)
    {
	setPreference("serverPort",port);
	// prefs = mActivity.getSharedPreferences("nSettings", Context.MODE_PRIVATE); 
	// SharedPreferences.Editor editor = prefs.edit();
	// editor.putInt("serverPort", port);  //or you can use putInt, putBoolean ... 
	// //editor.apply();
	// editor.commit();
    }
    public int getServerPort()    
    {
	prefs = mActivity.getSharedPreferences("nSettings", Context.MODE_PRIVATE);
	return prefs.getInt("serverPort",getDefaultPort());
    }

    //
    //-----------------------------------------------------------------------------------------
    //
    public String mkMessage(String message) 
    {
	Integer n, totalLen;
	n = message.length();
	String msg,lenStr;
	
	lenStr=Integer.toString(n);
	totalLen =lenStr.length() + n + 1;
	lenStr=Integer.toString(totalLen);
	msg = lenStr + " " + message;
	//Log.i("Message: ",msg);
	return msg;
    }
    public void toast (String msg, int gravity)
    {
	// //Toast.makeText (getApplicationContext(), msg, Toast.LENGTH_SHORT).show ();
	// Toast.makeText (mActivity, msg, Toast.LENGTH_SHORT).show ();

	//Toast.makeText (getApplicationContext(), msg, Toast.LENGTH_SHORT).show ();
	Toast mToast = Toast.makeText (mActivity, msg, Toast.LENGTH_SHORT);
	//mToast.setGravity(Gravity.TOP|Gravity.RIGHT, 0, 0);
	mToast.setGravity(gravity, 0, 0);
	mToast.show();
    } 

    //
    // Use from anywhere in the package (e.g., from inside anothe
    // thread) to toast a message).  This always runs the Toast in the
    // UI thread.
    //
    public void uiToast(String msg, int gravity)
    {
	class ToastOnUIThread implements Runnable
	{
	    String thisText;
	    int thisGravity;
	    ToastOnUIThread(String text, int gravity)   {thisText = text;thisGravity=gravity;}
	    public void run()  {toast(thisText,thisGravity);} 
	};
	
	mActivity.runOnUiThread(new ToastOnUIThread(msg,gravity));
    }

    public boolean isWifiConnected()
    {
	ConnectivityManager connManager = (ConnectivityManager) getActivity().getSystemService(Context.CONNECTIVITY_SERVICE);
	NetworkInfo mWifi = connManager.getNetworkInfo(ConnectivityManager.TYPE_WIFI);

	return mWifi.isConnected();
    }
}

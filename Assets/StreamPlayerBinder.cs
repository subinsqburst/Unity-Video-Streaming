using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;
using System.IO;

public class StreamPlayerBinder
{

[DllImport ("__Internal")]
	private static extern void playVideo(string url);
	
	public static void PlayVideo(string url)
	{
		if( Application.platform == RuntimePlatform.IPhonePlayer )
		{
			playVideo(url);
		}
	}
}

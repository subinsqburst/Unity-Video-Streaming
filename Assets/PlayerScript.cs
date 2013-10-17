using UnityEngine;
using System.Collections;

public class PlayerScript : MonoBehaviour {
	
	public string m_youtubeURL = "https://dl.dropboxusercontent.com/u/77018017/champion.mp4";
	//"https://dl.dropboxusercontent.com/u/77018017/Eric-Thomas-The-Truth-Motivational-Speech.mp4";
	private float	m_overrideWidth = 480f;
	private float	m_overrideHeight = 320f;
	private int     fontSize = 20;
	
	void OnGUI () {
	
		GUI.skin.button.fontSize = GUI.skin.textField.fontSize = fontSize;
		
		m_youtubeURL = GUI.TextField(new Rect(GetWidthByRatio(10f), GetHeightByRatio(10f), GetWidthByRatio(460f), GetHeightByRatio(20f)), m_youtubeURL);
		
		if(GUI.Button(new Rect(GetWidthByRatio(10f), GetHeightByRatio(35f), GetWidthByRatio(460f), GetHeightByRatio(20f)), "Play"))
		{
			StreamPlayerBinder.PlayVideo(m_youtubeURL);
		}
	}
	
	float GetWidthByRatio(float ratio)
	{
		return Screen.width / m_overrideWidth * ratio;
	}
		
	float GetHeightByRatio(float ratio)
	{
		return Screen.height / m_overrideHeight * ratio;
	}
}

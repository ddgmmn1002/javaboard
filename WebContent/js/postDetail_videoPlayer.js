//비디어 플레이어 객체
const tag = document.createElement("script");
tag.src = "https://www.youtube.com/iframe_api";
const firstScriptTag = document.getElementsByTagName("script")[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

let player;
function onYouTubeIframeAPIReady() {
	player = new YT.Player("player", {
		height: "540",
		width: "960",
		videoId: document.querySelector("#player").getAttribute("data-videoid"),
		playerVars: {
			rel: 0,
			controls: 0,
			autoplay: 1,
			mute: 0,
			playsinline: 1, //iOS환경에서 전체화면으로 재생하지 않게
		},
	});
}

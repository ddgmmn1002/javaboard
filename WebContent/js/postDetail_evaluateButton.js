const likeButton = document.querySelector("#like-button");
const dislikeButton = document.querySelector("#dislike-button");

const totalLikeCount = document.querySelector("#total-like-count");
const totalDislikeCount = document.querySelector("#total-dislike-count");

const likeIcon = document.querySelector("#like-icon");
const likeIconFill = document.querySelector("#like-icon-fill")
const dislikeIcon = document.querySelector("#dislike-icon");
const dislikeIconFill = document.querySelector("#dislike-icon-fill")

likeButton.addEventListener("click", () => {
	evaluateButton(true);
});
dislikeButton.addEventListener("click", () => {
	evaluateButton(false);
});

async function evaluateButton(isLike) {
	await fetch("likePost", {
		method: "POST",
		headers: {
			"Content-Type": "application/json"
		},
		body: JSON.stringify({
			pno: ${post.getPno()},
			isLike: isLike
		})
	})
 	.then((resp) => resp.json())
	.then((data) => {
		totalLikeCount.innerText = data.totalLikeCount;
		totalDislikeCount.innerText = data.totalDislikeCount;
		const userInteraction = JSON.parse(data.userInteraction);
 		if (userInteraction.likeStatus) {
			likeButton.checked = true;
			likeIconFill.classList.remove("hidden");
			likeIcon.classList.add("hidden");
		} else {
			likeButton.checked = false;
			likeIconFill.classList.add("hidden");
			likeIcon.classList.remove("hidden");
		}
		if (userInteraction.dislikeStatus) {
			dislikeButton.checked = true;
			dislikeIconFill.classList.remove("hidden");
			dislikeIcon.classList.add("hidden");
		} else {
			dislikeButton.checked = false;
			dislikeIconFill.classList.add("hidden");
			dislikeIcon.classList.remove("hidden");
		}
	})
	.catch(error => {
			console.error("Error:", error);
	});
}
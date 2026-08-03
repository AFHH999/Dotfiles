-- /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  --
-- name "Minimal-2"
-- credit https://github.com/prasanthrangan/hyprdots

hl.config({
	animations = {
		enabled = true,
		bezier = {
			{ "quart", 0.25, 1, 0.5, 1 },
		},
		animation = {
			{ "windows", 1, 6, "quart", "slide" },
			{ "border", 1, 6, "quart" },
			{ "borderangle", 1, 6, "quart" },
			{ "fade", 1, 6, "quart" },
			{ "workspaces", 1, 6, "quart" },
		},
	},
})

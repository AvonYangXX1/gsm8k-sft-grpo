# Learning roadmap / 学习路线

All milestones start unchecked. Understanding and evidence should be recorded together.

- [ ] Read one raw GSM8K question/solution and inspect its tokenized SFT and RL forms.
- [ ] Explain SFT: teacher forcing, next-token cross entropy, response mask, gradient update.
- [ ] Read the official GSM8K answer extractor and reward scorer; test correct, incorrect, missing and malformed final answers.
- [ ] Explain GRPO: group sampling, reward, relative advantage, policy ratio, clipping and reference KL.
- [ ] Inspect a group of real generated responses and manually reproduce its rewards and advantages.
- [ ] Select a small Qwen model and hardware budget; pin all versions.
- [ ] Create train/validation indices from the official training split.
- [ ] Implement a shared evaluation path and measure E0.
- [ ] Smoke-test SFT and direct GRPO before longer jobs.
- [ ] Run E1, E2 and E3 using a documented comparison budget.
- [ ] Compare accuracy, response length, compute cost and representative failures.
- [ ] Discuss observations and open questions with Wenkai.

First meeting deliverable: one annotated training batch and one manually checked GRPO group. Full benchmark results can follow.


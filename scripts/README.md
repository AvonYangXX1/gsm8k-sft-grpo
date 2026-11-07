# Scripts and upstream entry points

Only setup_upstream.sh is implemented here. It checks out the recorded official source and does not install dependencies or submit training jobs.

Verified upstream paths at the recorded revision:
- examples/data_preprocess/gsm8k.py
- examples/sft/gsm8k/run_qwen2_5_0_5b_fsdp.sh
- examples/grpo_trainer/run_qwen3_8b_fsdp.sh
- docs/algo/grpo.md

The SFT and GRPO examples have different default model sizes. They are reading references, not a matched comparison.
The GRPO example includes GSM8K AND MATH and multiple devices by default. Adapt it for GSM8K-only, the selected model, device count, paths and budget before launch.
The preprocessing example produces train.parquet and test.parquet. Create a validation subset from train before using the trainer; do not use official test for checkpoint selection.
SFT needs target solution text and response loss masking; RL uses prompts plus ground truth for scoring. Verify each trainer's expected schema.

Before a full run:
1. Select one shared starting checkpoint and immutable model/tokenizer revisions.
2. Install the pinned upstream environment on the GPU machine.
3. Save split indices, resolved config and exact launch command.
4. Smoke-test a few training steps; verify finite loss, reward parsing, sample generation, checkpoint saving and reload.
5. Run a fixed evaluation baseline before training.

GPU compatibility, SFT/GRPO launch scripts and evaluation implementation remain pending.


# Code-reading guide

Work inside the pinned vendor/verl checkout. Use rg to locate symbols; record file paths and line numbers in your notes.

| Question | Starting point / search |
| --- | --- |
| What does an RL dataset row contain? | examples/data_preprocess/gsm8k.py |
| How is a numerical answer extracted/scored? | verl/utils/reward_score/gsm8k.py |
| How do SFT targets and loss masks work? | Follow the trainer invoked by examples/sft/gsm8k/run_qwen2_5_0_5b_fsdp.sh |
| How does GRPO sampling start? | examples/grpo_trainer/run_qwen3_8b_fsdp.sh; trace main_ppo |
| Where are advantages computed? | Search compute_grpo_outcome_advantage |
| Where are clipping and KL applied? | Follow the actor loss selected by the resolved config |

For a group with scalar rewards r_i, a common GRPO advantage is
A_i = (r_i - mean(r)) / (std(r) + epsilon).
For rewards [1, 0, 0, 1], mean reward is 0.5: correct responses have positive advantage, incorrect responses negative.
Exact values depend on the implementation's standard-deviation convention and epsilon. Equal rewards provide no within-group reward advantage; KL can still affect the update.

SFT learns from target response tokens. GRPO learns from model-generated responses and their rewards, without a separate learned critic in standard GRPO.
The old policy supplies the sampling-policy log probabilities used in a probability ratio; the reference policy supplies the KL anchor. These roles differ even when checkpoints initially match.
An optimization step can be influenced by clipping, masking, loss aggregation and KL, so reward alone does not specify the gradient.

Read the configured scorer rather than assuming every reward implementation uses identical formatting penalties.


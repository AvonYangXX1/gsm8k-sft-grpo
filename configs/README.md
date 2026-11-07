# Configuration decisions

No GPU training configuration is validated yet.

Before adding a runnable config, record:
- Model and tokenizer IDs/revisions; base vs instruct status; chat template.
- Pinned verl commit; Python, PyTorch, CUDA and rollout backend versions.
- Train/validation split seed and indices; official test reserved for reporting.
- Prompt/response limits; truncation; batch/mini-batch sizes; learning rate; seed.
- SFT target field and response-only loss mask.
- GRPO adv_estimator=grpo; rollout.n > 1; standard-deviation normalization choice; clipping; KL coefficient/type; reference checkpoint; loss aggregation.
- Device count/type, memory, distributed strategy and training budget.
- Validation schedule and checkpoint selection criterion.

Use upstream's resolved configuration as the authority. Some verl parameter names contain ppo even when training GRPO.


# GSM8K: SFT and GRPO with verl

A learning and reproduction project built on [verl-project/verl](https://github.com/verl-project/verl).

**Status: repository initialized; no training or evaluation has been run.**
The first goal is to understand the complete training loop and reproduce a small experiment before extending it.

## 学习目标

- **SFT**：理解 question / solution 如何转换成 token，response mask 如何控制交叉熵 loss，以及反向传播更新了什么。
- **GRPO**：理解每道题的多次 rollout、规则 reward、组内 advantage、old / reference log probabilities、clipping 和 KL。
- **Evaluation**：在相同模型起点、数据划分和解码协议下比较训练前后表现，检查真实生成样例。

## Planned experiments

| ID | Starting checkpoint | Training | Status |
| --- | --- | --- | --- |
| E0 | One selected pretrained/instruct checkpoint | None; baseline evaluation | Not started |
| E1 | Same checkpoint as E0 | SFT | Not started |
| E2 | Same checkpoint as E0 | Direct GRPO | Not started |
| E3 | E1 checkpoint | GRPO after SFT | Not started |

Model, GPU allocation and training budgets are **not selected yet**. An instruct checkpoint already has prior post-training; it should not be described as a raw base model. Compare at matched budgets and report any remaining differences.

## Start here

1. Read [the roadmap](notes/ROADMAP.md) and [the code-reading guide](notes/CODE_READING.md).
2. Run `bash scripts/setup_upstream.sh` to check out the recorded upstream revision.
3. Follow that revision's installation instructions on the training machine; this repo does not install GPU dependencies automatically.
4. Choose the model and GPU budget, create a train/validation split, and record the environment using [the run template](experiments/RUN_TEMPLATE.md).
5. Adapt and smoke-test the official examples before a full GPU run. [Script notes](scripts/README.md) list the verified upstream entry points.

## Contents

| Path | Purpose |
| --- | --- |
| `upstream/verl.lock.json` | Upstream URL and reviewed commit |
| `scripts/` | Upstream checkout helper and preparation instructions |
| `configs/` | Configuration decisions to complete before training |
| `notes/` | Learning roadmap, code tracing, meeting record |
| `experiments/` | Per-run template and evaluation protocol |
| `results/summary.csv` | Header-only result table; no fabricated scores |

## Evaluation rules

Split validation from the GSM8K **training** partition with a recorded seed and saved indices. Use validation for debugging and checkpoint selection; reserve the official test partition for final reporting. The upstream preprocessing example writes train/test parquet files; it does not create our train/validation split.

Record exact model/tokenizer revisions, prompt/chat template, answer extraction, sampling parameters and truncation rules. Report greedy exact-match accuracy separately from sampled pass@1 or pass@k. A correct final answer does not establish that every reasoning step is correct.

Keep weights, raw datasets, caches and bulky logs outside Git. Commit configs, concise metrics, curves and a small set of attributable examples.

## Collaboration

Use GitHub Issues for questions and experiment decisions. Collaborator invitation for `Wenkaihann` must be completed in repository Settings → Collaborators; this README does not imply that an invitation has been sent.

## Upstream references

- [verl](https://github.com/verl-project/verl)
- [GRPO documentation](https://github.com/verl-project/verl/blob/b17218ba58a6fbcdfb0de32772e3c2a79f88529d/docs/algo/grpo.md)
- [GSM8K preprocessing](https://github.com/verl-project/verl/blob/b17218ba58a6fbcdfb0de32772e3c2a79f88529d/examples/data_preprocess/gsm8k.py)
- [DeepSeekMath](https://arxiv.org/abs/2402.03300)

This repository contains project-specific learning material and wrappers. Upstream source remains in its own checkout and retains its original license.


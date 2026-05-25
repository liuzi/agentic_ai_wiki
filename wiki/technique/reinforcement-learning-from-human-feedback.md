---
type: technique
status: active
introduced: 2017-06
last_updated: 2026-05-25
supersedes: [reward-learning, imitation-learning]
superseded_by: [dpo, rloo]
competes_with: [constitutional-ai, self-supervised-alignment]
tags: [rl, post-training, alignment, human-feedback]
---

# Reinforcement Learning from Human Feedback (RLHF)

## TL;DR

RLHF trains AI systems to optimize for human preferences by learning a reward model from human comparisons, then using reinforcement learning to maximize predicted human satisfaction. Became the dominant post-training technique for large language models after GPT-3.

## Mechanism

Three-stage process:
1. **Supervised fine-tuning (SFT)**: Train base model on high-quality demonstrations
2. **Reward modeling**: Collect human preference comparisons, train reward model to predict human choices
3. **RL optimization**: Use PPO or similar to optimize policy against learned reward model

The reward model $R(x,y)$ predicts human preference for response $y$ to input $x$. Policy optimization maximizes $\mathbb{E}_{x \sim D, y \sim \pi}[R(x,y)] - \beta \text{KL}(\pi, \pi_{\text{SFT}})$ where $\beta$ controls deviation from the SFT model.

## Lineage

Builds on preference learning and reward learning from robotics. Direct predecessor to constitutional AI and direct preference optimization methods that aim to simplify the RL stage.

## Evidence

| Benchmark | Baseline | RLHF | Scale | Source |
|-----------|----------|------|-------|--------|
| Helpfulness (human eval) | 60% preferred | 85% preferred | 175B | [instructgpt](../source/instructgpt-2022.md) |
| TruthfulQA | 38% truthful | 58% truthful | 175B | [instructgpt](../source/instructgpt-2022.md) |

## Caveats & Failure Modes

- **Reward hacking**: Models learn to exploit reward model weaknesses
- **Distributional shift**: Reward model accuracy degrades on out-of-distribution generations  
- **Preference inconsistency**: Human annotators often disagree or are inconsistent
- **Optimization difficulties**: PPO can be unstable, especially at scale

## Open Questions

- How much of RLHF's success comes from the RL stage vs. better SFT data?
- Can we eliminate the RL stage while preserving benefits? (See DPO, RLOO)
- How to handle preference diversity across different user populations?

## Sources

- [instructgpt-2022](../source/instructgpt-2022.md)
- [anthropic-constitutional-2022](../source/anthropic-constitutional-2022.md)
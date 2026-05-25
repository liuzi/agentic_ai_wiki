---
type: source
source_kind: paper
date: 2022-03-04
arxiv: 2203.02155
authors: [ouyang-l, wu-j, jiang-x]
venue: neurips-2022
status: read
confidence: high
---

# Training language models to follow instructions with human feedback

**Citation:** Ouyang, Long et al. "Training language models to follow instructions with human feedback." NeurIPS, 2022. [arXiv:2203.02155](https://arxiv.org/abs/2203.02155) | [Local copy](../../raw/2022/arxiv/instructgpt-2022.pdf)

## Claim

RLHF can align language models with human intent better than supervised fine-tuning alone, producing models that are more helpful, harmless, and honest.

## Method

Three-step process: (1) supervised fine-tuning on demonstration data, (2) training reward model on comparison data, (3) PPO optimization against reward model. Evaluated on 175B GPT-3 base model.

## Results

- Human evaluators prefer InstructGPT outputs 85% vs 60% for GPT-3
- TruthfulQA: 58% vs 38% truthful responses  
- Reduced toxic outputs while maintaining performance on NLP benchmarks
- Benefits persist even when generalizing to instructions not in training data

## What's New

First large-scale demonstration that RLHF works for general language model alignment. Previous work focused on specific domains (summarization, dialogue). Shows three-stage process scales to 175B parameters.

## What I'd Push On

- Limited diversity in human annotators (mostly US-based)
- Evaluation metrics still somewhat subjective
- Reward model may not capture all aspects of human preference
- No analysis of failure modes or edge cases

## Touches

- [reinforcement-learning-from-human-feedback](../technique/reinforcement-learning-from-human-feedback.md)
- [constitutional-ai](../technique/constitutional-ai.md)
- [helpfulness-evaluation](../benchmark/helpfulness-evaluation.md)
---
type: source
source_kind: paper
date: 2026
authors: [smith-j, zhang-l, patel-r, kim-s]
venue: arxiv
status: read
confidence: high
arxiv: 2606.12345
---

# Code as Agent Harness: Evaluating LLMs for Agent Programming

## Citation

**Citation:** Smith, J., Zhang, L., Patel, R., Kim, S. "Code as Agent Harness: Evaluating LLMs for Agent Programming." arXiv preprint, 2026. [arXiv](https://arxiv.org/abs/2606.12345) | **Local copy**: [raw/2026/arxiv/code_as_agent_harness-2026.pdf](../../raw/2026/arxiv/code_as_agent_harness-2026.pdf)

## Claim

Large language models should be evaluated on their ability to generate code within agentic workflows that involve multi-step reasoning, tool integration, and iterative refinement, rather than just standalone coding tasks.

## Method

The authors introduce a new evaluation benchmark that tests LLMs on:

1. **Multi-step agent programming tasks** where code generation is embedded within broader problem-solving workflows
2. **Tool integration scenarios** requiring models to write code that interfaces with external APIs, databases, and system tools
3. **Iterative refinement processes** where initial code solutions must be debugged, optimized, and adapted based on execution feedback
4. **Context-aware programming** where code must be generated considering prior conversation history and evolving task requirements

The benchmark includes tasks across domains like data analysis, system automation, and research workflows, with evaluation criteria focusing on functional correctness, code quality, and integration effectiveness.

## Results

Key findings from the evaluation:

- **Performance gaps**: Significant variation in model performance between standalone coding and agent-embedded coding tasks
- **Tool integration challenges**: Models struggle with correct API usage and error handling in multi-tool workflows  
- **Context utilization**: Performance degrades as conversation context length increases and task complexity grows
- **Iterative improvement**: Limited ability to effectively debug and refine code based on execution feedback

Specific numerical results were not fully disclosed but indicated substantial room for improvement across all tested models.

## What's new

This work distinguishes itself from existing coding benchmarks by:

1. **Agentic context focus**: Evaluates coding within realistic agent workflows rather than isolated programming tasks
2. **Multi-step integration**: Tests code generation as part of broader problem-solving sequences
3. **Real-world tool usage**: Incorporates external tool and API integration requirements
4. **Iterative refinement evaluation**: Measures ability to improve code based on feedback and execution results

## What I'd push on

- **Limited baseline comparisons**: Unclear how performance compares to existing coding benchmarks like HumanEval or MBPP
- **Evaluation criteria subjectivity**: Code quality and integration effectiveness metrics may lack standardized scoring
- **Task domain coverage**: Potential bias toward specific types of agent workflows (data analysis, automation)
- **Contamination risk**: New benchmark may lack sufficient safeguards against training data contamination
- **Scalability concerns**: Evaluation methodology may not scale to more complex, long-running agent scenarios

## Touches

- [Code as Agent Harness](../benchmark/code-as-agent-harness.md) — New benchmark introduced by this paper
- [FrontierCode](../benchmark/frontiercode.md) — Related coding evaluation but with different focus  
- [Long-Running Agent Harnesses](../technique/long-running-agent-harnesses.md) — Multi-step agent workflow patterns
- [Test-Time Compute](../technique/test-time-compute.md) — Iterative reasoning and refinement capabilities
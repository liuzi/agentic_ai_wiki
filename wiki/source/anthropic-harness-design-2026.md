---
type: source
source_kind: blog
date: 2026-05-26
arxiv: 
authors: [rajasekaran-prithvi]
venue: anthropic-engineering
status: read
confidence: high
---

# Harness design for long-running application development

**Citation:** Rajasekaran, Prithvi. "Harness design for long-running application development." Anthropic Engineering Blog, 2026. [URL](https://www.anthropic.com/engineering/harness-design-long-running-apps) | [Local copy](../../raw/2026/anthropic/Harness%20design%20for%20long-running%20application%20development.md)

## Claim

GAN-inspired multi-agent architectures with specialized generator, evaluator, and planner agents can achieve significantly higher-quality long-running application development than single-agent approaches, despite 20x higher costs, by addressing self-evaluation blindness and enabling iterative quality improvement.

## Method

Systematic development of multi-agent harness architecture inspired by Generative Adversarial Networks:

1. **Generator-Evaluator Pattern for Frontend Design**: 
   - Generator creates HTML/CSS/JS implementations from prompts
   - Evaluator uses Playwright MCP to interact with live pages before scoring against four criteria: design quality, originality, craft, functionality
   - 5-15 iteration cycles with strategic decisions to refine or pivot aesthetics
   - Few-shot calibration to align evaluator judgment with human preferences

2. **Three-Agent Full-Stack Architecture**:
   - **Planner**: Expands 1-4 sentence prompts into comprehensive product specs with AI feature integration
   - **Generator**: Implements features in sprints using React/Vite/FastAPI/SQLite stack with git version control
   - **Evaluator**: Uses Playwright MCP for end-to-end testing, grades against contract criteria with hard thresholds

3. **Sprint Contracts**: Generator and evaluator negotiate success criteria before implementation begins

4. **Model Evolution Adaptation**: Systematic simplification as models improved from Opus 4.5 to 4.6, removing sprint structure while maintaining evaluator for edge-case validation

**Key innovation**: Separating generation from evaluation addresses agent self-evaluation blindness, while structured criteria convert subjective judgments into gradable assessments.

## Results

**Frontend Design Performance**:
- Iterative improvement over 5-15 cycles before plateauing
- Dramatic aesthetic improvements including creative leaps (e.g., 3D spatial museum website)
- Evaluator scores correlated with perceived quality improvements
- Generator learned strategic refinement vs. aesthetic pivoting

**Full-Stack Development Comparison**:
| Approach | Duration | Cost | Quality |
|----------|----------|------|---------|
| Single agent | 20 min | $9 | Basic functionality, broken core features |
| Full harness (4.5) | 6 hr | $200 | Production-quality with working game physics |
| Simplified harness (4.6) | 3.8 hr | $125 | Feature-complete DAW with AI agent integration |

**Concrete Quality Improvements**:
- Game maker: Solo run had broken entity-runtime wiring; harness version had working physics and AI assistance
- DAW: Multi-round QA caught missing core interactions (clip dragging, instrument panels, audio recording)
- Evaluator identified specific bugs: routing errors, UI state management issues, API endpoint problems

**Model Evolution Insights**:
- Opus 4.6 eliminated need for sprint decomposition structure due to improved context handling
- Context anxiety largely resolved in 4.6 vs. severe manifestation in 4.5
- Evaluator value became task-dependent: high value for edge-case tasks, unnecessary for capabilities within model's reliable range

## What's new

- **GAN-inspired agent orchestration**: First application of adversarial network concepts to software development agents
- **Subjective quality evaluation framework**: Concrete grading criteria converting aesthetic judgments into measurable assessments
- **Sprint contract negotiation**: Pre-implementation agreement protocol between agents on success criteria
- **Systematic harness evolution methodology**: Principled approach to simplifying complexity as underlying models improve
- **Live interaction evaluation**: Evaluator agents actively navigating applications rather than static code review
- **Multi-hour autonomous development**: Sustained coherent work across 6+ hour sessions producing complex applications

## What I'd push on

- **Cost-benefit analysis**: 20x cost increase ($9 → $200) may not be justified for many use cases
- **Evaluation criteria generalization**: Design aesthetics criteria may reflect author's specific preferences rather than universal principles  
- **Model dependency**: Heavy reliance on specific Opus capabilities - unclear how patterns transfer to other model families
- **Orchestration complexity**: Three-agent coordination introduces failure modes and debugging complexity not well characterized
- **Domain limitations**: Only validated on frontend design + full-stack coding - generalization to other domains uncertain
- **Evaluation calibration**: Few-shot tuning of evaluator judgment may not scale or maintain consistency over time
- **Context anxiety resolution**: Unclear whether 4.6 improvements generalize beyond Anthropic models

## Touches

- [gan-inspired-agent-architectures](../technique/gan-inspired-agent-architectures.md) - Primary technique introduced
- [long-running-agent-harnesses](../technique/long-running-agent-harnesses.md) - Foundation technique this builds upon
- [context-anxiety](../concept/context-anxiety.md) - Model evolution from Opus 4.5 to 4.6 largely resolved this issue
- [managed-agents](../technique/managed-agents.md) - Complementary infrastructure approach
- **Tools**: Claude Agent SDK, Playwright MCP, frontend design skills, git version control
- **Models**: Claude Opus 4.5 (context anxiety), Claude Opus 4.6 (improved long-context performance)
- **Applications**: Frontend design, game development, music production (DAW), full-stack web development
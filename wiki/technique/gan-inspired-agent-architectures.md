---
type: technique
status: active
introduced: 2026-05
last_updated: 2026-05-26
supersedes: [single-agent-loops, dual-agent-harnesses]
superseded_by: []
competes_with: [multi-agent-systems, crew-ai, autogen]
tags: [multi-agent, gan-inspired, generator-evaluator, quality-improvement, iterative-refinement]
---

# GAN-Inspired Agent Architectures

## TL;DR

GAN-inspired agent architectures apply the generator-evaluator pattern from Generative Adversarial Networks to AI agent systems, using specialized agents for creation and evaluation to overcome self-evaluation blindness and drive iterative quality improvement in complex tasks like software development and design.

## Mechanism

Multi-agent architecture inspired by adversarial networks with role separation:

### Core Pattern: Generator-Evaluator Loop

1. **Generator Agent**: Creates outputs (code, designs, content) based on specifications and previous feedback
2. **Evaluator Agent**: Assesses outputs against structured criteria using independent judgment
3. **Iterative Refinement**: Generator receives detailed feedback and either refines current approach or pivots to new strategy
4. **Quality Progression**: Multiple cycles drive outputs toward higher quality through adversarial-like pressure

### Advanced Pattern: Three-Agent Architecture

**Planner Agent**:
- Expands high-level prompts into detailed specifications
- Focuses on scope and product requirements rather than implementation details
- Integrates AI feature opportunities into specifications

**Generator Agent**: 
- Implements specifications using appropriate technical stacks
- Works incrementally (feature-by-feature or sprint-by-sprint)
- Makes strategic decisions about refinement vs. pivoting based on feedback

**Evaluator Agent**:
- Uses concrete grading criteria rather than subjective assessment
- Employs active interaction (browser automation, live testing) rather than static review
- Maintains hard thresholds for quality gates

### Key Innovations

**Sprint Contracts**: Pre-implementation negotiation between generator and evaluator on success criteria and testing methods

**Structured Evaluation Criteria**: Converting subjective judgments into concrete, gradable assessments:
- Design quality: coherence, mood, identity
- Originality: custom decisions vs. template patterns
- Craft: technical execution competence
- Functionality: usability independent of aesthetics

**Strategic Decision Making**: Generator learns when to refine incrementally vs. pivot to entirely different approaches

## Lineage

**Descends from**:
- Generative Adversarial Networks (GANs) - foundational adversarial pattern
- Multi-agent systems research
- Long-running agent harnesses (dual-agent approaches)
- Software engineering practices (code review, QA)

**Competes with**:
- CrewAI and AutoGen multi-agent frameworks
- Single-agent iterative approaches
- Human-in-the-loop review systems

**Extends**:
- [Long-Running Agent Harnesses](long-running-agent-harnesses.md) - builds on dual-agent foundation
- [Managed Agents](managed-agents.md) - complementary infrastructure approach

## Evidence

| Application | Agents | Duration | Cost | Quality Improvement | Source |
|-------------|--------|----------|------|-------------------|--------|
| Frontend design | Generator + Evaluator | Up to 4hr | Not specified | Museum website: 10th iteration creative leap to 3D spatial experience | anthropic-harness-design-2026 |
| Game development | Planner + Generator + Evaluator | 6hr | $200 | Solo: broken core features → Harness: working physics + AI integration | anthropic-harness-design-2026 |
| DAW development | Planner + Generator + Evaluator | 3.8hr | $125 | Multi-round QA caught missing core interactions, audio recording stubs | anthropic-harness-design-2026 |
| Cost comparison | Single vs. Multi-agent | 20min vs 6hr | $9 vs $200 | 20x cost increase, major quality improvement | anthropic-harness-design-2026 |

## Caveats & failure modes

- **High computational cost**: 20x more expensive than single-agent approaches ($9 → $200 in tested example)
- **Orchestration complexity**: Multi-agent coordination introduces debugging challenges and failure modes
- **Evaluation criteria dependency**: Quality heavily depends on well-calibrated grading criteria and evaluator tuning
- **Model specificity**: Designed for Claude Opus 4.5/4.6 - transfer to other models unclear
- **Domain limitations**: Only validated on frontend design and full-stack coding - generalization uncertain
- **Evaluation drift**: Evaluator judgment may shift over time without recalibration
- **Subjective bias**: Grading criteria may reflect specific preferences rather than universal quality principles

## Specific Patterns

**Generator-Evaluator Feedback Loop**:
```
1. Generator creates output from prompt/spec
2. Evaluator interacts with output (live testing, navigation)
3. Evaluator scores against structured criteria
4. Generator receives detailed feedback
5. Generator decides: refine current direction OR pivot to new approach
6. Repeat for 5-15 iterations until plateau
```

**Sprint Contract Negotiation**:
```
1. Planner creates high-level specification
2. Generator proposes implementation approach and success criteria
3. Evaluator reviews proposal for completeness and testability
4. Iterate until both agents agree on contract
5. Generator implements against agreed contract
6. Evaluator grades based on negotiated criteria
```

**Quality Criteria Framework**:
- **Design Quality**: Coherence, mood, identity (weighted heavily)
- **Originality**: Custom decisions vs. generic patterns (weighted heavily)  
- **Craft**: Technical execution competence (baseline expectation)
- **Functionality**: Usability independent of aesthetics (baseline expectation)

## Model Evolution Adaptation

**Opus 4.5 → 4.6 Changes**:
- Eliminated need for sprint decomposition due to improved long-context handling
- Reduced context anxiety manifestations
- Maintained evaluator for edge-case validation but reduced necessity for core capabilities
- Enabled single-session multi-hour coherent development

**Adaptation Methodology**:
1. Identify components that compensate for model limitations
2. Test removing components as models improve
3. Maintain components that provide value beyond model baseline capabilities
4. Add new components to push beyond new model capabilities

## Open questions

- How does the approach scale to even more complex applications (enterprise software, scientific modeling)?
- Can evaluator criteria be learned automatically rather than manually crafted?
- What's the optimal cost-benefit threshold for deploying multi-agent vs. single-agent approaches?
- How do failure modes manifest in orchestration of 3+ specialized agents?
- Can the generator-evaluator pattern be applied beyond software development to other creative domains?
- How should harness complexity adapt as foundation models continue improving?

## Sources

- [anthropic-harness-design-2026](../source/anthropic-harness-design-2026.md) - Primary introduction and comprehensive case studies
- Generative Adversarial Networks literature - foundational inspiration for adversarial pattern
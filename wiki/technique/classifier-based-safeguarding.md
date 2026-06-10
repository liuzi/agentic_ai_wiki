---
type: technique
status: active
introduced: 2026-06
last_updated: 2026-06-10
supersedes: []
superseded_by: []
competes_with: [constitutional-ai, rlhf-safety, content-filtering]
tags: [ai-safety, deployment, misuse-prevention, classifiers]
---

# Classifier-Based Safeguarding

## TL;DR

Classifier-based safeguarding uses separate AI systems to detect potential misuse of frontier models and automatically redirect responses to less capable models rather than refusing queries. This maintains user experience while preventing dangerous capabilities from reaching bad actors.

## Mechanism

The technique involves three key components:

**Detection layer**: Specialized AI classifiers trained to identify requests that could lead to misuse across specific domains (cybersecurity, biology/chemistry, model distillation). These classifiers run alongside the main model to evaluate incoming queries.

**Fallback routing**: When misuse is detected, the system automatically routes the request to a less capable but still useful model (e.g., Opus 4.8 instead of Mythos 5) without informing the user of the capability downgrade.

**Coverage tuning**: Classifiers are deliberately tuned conservatively to minimize false negatives (missing actual misuse) at the cost of higher false positives (blocking benign requests), with ongoing refinement to reduce unnecessary blocks.

Unlike traditional content filtering that simply blocks harmful requests, this approach maintains functionality by providing a degraded but still valuable response from a safer model.

## Lineage

**Descends from:** Constitutional AI and content moderation systems, extending the idea of AI-based safety filters to capability-level routing rather than binary blocking.

**Competes with:**
- Constitutional AI training approaches that embed safety at the model level
- RLHF safety methods that train models to refuse harmful requests
- Traditional content filtering that blocks rather than redirects

**Related to:** Defensive acceleration strategies that manage access to dangerous capabilities while preserving beneficial uses.

## Evidence

| Domain | Effectiveness | Fallback Rate | Source |
|---------|-------------|---------------|---------|
| General use | >95% sessions no fallback | <5% of sessions | [anthropic-fable-5-mythos-5-2026](../source/anthropic-fable-5-mythos-5-2026.md) |
| Cybersecurity | 0% compliance with harmful requests | N/A | [anthropic-fable-5-mythos-5-2026](../source/anthropic-fable-5-mythos-5-2026.md) |
| Jailbreak resistance | No universal jailbreaks found | N/A (1000+ hours testing) | [anthropic-fable-5-mythos-5-2026](../source/anthropic-fable-5-mythos-5-2026.md) |

## Caveats & Failure modes

- **False positive burden**: Conservative tuning leads to unnecessary capability downgrades for legitimate users
- **Jailbreak evolution**: Sophisticated adversaries may develop attacks specifically targeting classifier blind spots
- **Capability leakage**: Fallback models may still provide some dangerous information, just at lower sophistication
- **User trust**: Hidden capability switching may undermine user confidence when discovered
- **Classifier drift**: Maintaining effectiveness as both attack methods and underlying models evolve

## Open questions

- How do users respond when they discover capability switching has occurred?
- What is the optimal false positive/false negative trade-off for different domains?
- Can classifiers be made robust against adversarial attacks designed specifically to evade them?
- How does this approach scale as the gap between frontier and fallback models widens?
- What domains beyond cyber/bio/distillation might require similar safeguarding?

## Sources

- [Anthropic Fable 5 and Mythos 5](../source/anthropic-fable-5-mythos-5-2026.md) — First deployment of classifier-based safeguarding at scale
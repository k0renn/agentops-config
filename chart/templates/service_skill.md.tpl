---
name: service-contract
description: Service-specific contract and evidence-backed scope rules for {{ .Values.service.id }}.
license: MIT
metadata:
  domain: governance
  role: policy
  scope: repository
---

# Service Contract Skill — {{ .Values.service.id }}

Team: {{ .Values.team.name }}
Base policy: {{ .Values.team.base_policy }}

Canonical service type: **{{ .Values.canonical_service_type.chosen }}**
Source of truth: {{ .Values.service.source_of_truth }}

## Owned Responsibilities
{{- range .Values.owned_responsibilities }}
- {{ .title }}
{{- range .evidence }}
  - Evidence: {{ . }}
{{- end }}
{{- end }}

## Forbidden Responsibilities
{{- range .Values.forbidden_responsibilities }}
- {{ .title }}
{{- range .evidence }}
  - Evidence: {{ . }}
{{- end }}
{{- end }}

## Allowed Paths
{{- range .Values.allowed_paths }}
- {{ . }}
{{- end }}

## Hard Prohibitions
{{- range .Values.hard_prohibitions }}
- {{ . }}
{{- end }}

## Enforcement
{{- range .Values.enforcement }}
- {{ . }}
{{- end }}

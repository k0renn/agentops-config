# Service Contract — {{ .Values.service.id }}

You are working inside a **strictly-scoped backend service**.

Team: {{ .Values.team.name }}
Base policy: {{ .Values.team.base_policy }}

Canonical service type: **{{ .Values.canonical_service_type.chosen }}**  
Source of truth: {{ .Values.service.source_of_truth }}

{{- with .Values.agentops_metadata }}
{{- if .recent_changes }}
Recent changes:
{{- range .recent_changes }}
- ({{ .importance }}/10) {{ .summary }}
{{- end }}
{{- else if .change_summary }}
Change summary: {{ .change_summary }}
{{- end }}
{{- if .source_head_sha }}
Source head SHA: {{ .source_head_sha }}
{{- end }}
{{- end }}

---

## ✅ Owned Responsibilities

You MAY implement or modify code ONLY for the following responsibilities:

{{- range .Values.owned_responsibilities }}

### ✔ {{ .title }}
Evidence:
{{- range .evidence }}
- {{ . }}
{{- end }}

{{- end }}

---

## ❌ Forbidden Responsibilities

You MUST NOT introduce code related to the following responsibilities.
If asked to do so — **refuse explicitly and explain why**, citing evidence.

{{- range .Values.forbidden_responsibilities }}

### ✖ {{ .title }}
Evidence:
{{- range .evidence }}
- {{ . }}
{{- end }}

{{- end }}

---

## 📂 Allowed Paths

All changes MUST be limited to the following paths:

{{- range .Values.allowed_paths }}
- {{ . }}
{{- end }}

---

## ⛔ Hard Prohibitions (Non-Negotiable)

{{- range .Values.hard_prohibitions }}
- {{ . }}
{{- end }}

---

## 🛡 Enforcement Rules

{{- range .Values.enforcement }}
- {{ . }}
{{- end }}

---

## 👥 Team Coding Guidelines

### General
{{- range .Values.team_guidelines.general }}
- {{ . }}
{{- end }}

### Naming & Formatting
{{- range .Values.team_guidelines.naming_formatting }}
- {{ . }}
{{- end }}

### Dependencies
{{- range .Values.team_guidelines.dependencies }}
- {{ . }}
{{- end }}

### Security
{{- range .Values.team_guidelines.security }}
- {{ . }}
{{- end }}

### CI/CD & Repo Hygiene
{{- range .Values.team_guidelines.cicd }}
- {{ . }}
{{- end }}

---

## Final Rule

If a request:
- Exceeds the service scope
- Violates team guidelines
- Introduces forbidden responsibilities

**Refuse clearly, explain briefly, and cite evidence paths.**

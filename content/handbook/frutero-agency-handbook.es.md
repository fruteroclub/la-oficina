---
title: "Manual de Frutero Agency"
subtitle: "Cómo operamos, cómo te puedes sumar, y cómo trabajamos con clientes."
slug: frutero-agency-handbook
lang: es
audience: [club-members, prospective-operators, prospective-clients]
status: living-doc
last_updated: 2026-05-13
canonical: true
---

# Manual de Frutero Agency

Este manual es la fuente de verdad sobre **cómo opera Frutero Agency** — la agencia de servicios técnicos que vive arriba de La Oficina y que se alimenta del talento formado en el Frutero Club.

Es un documento vivo. Cambia cuando algo cambia. Si encontrás contradicciones entre este manual y la realidad, la realidad gana — y este documento se actualiza.

Está organizado por audiencia. Salta a la sección que te aplica.

- [§1 — Si sos miembro del Frutero Club](#1-si-sos-miembro-del-frutero-club)
- [§2 — Si querés ser Operator en un pod](#2-si-quer%C3%A9s-ser-operator-en-un-pod)
- [§3 — Si tu empresa quiere contratar un engagement](#3-si-tu-empresa-quiere-contratar-un-engagement)
- [§4 — Cómo opera un pod-day](#4-c%C3%B3mo-opera-un-pod-day)
- [§5 — Cómo nos comunicamos](#5-c%C3%B3mo-nos-comunicamos)
- [§6 — Qué viene en las próximas semanas](#6-qu%C3%A9-viene-en-las-pr%C3%B3ximas-semanas)

Si llegaste sin contexto, leé primero el post **[Por qué Frutero está construyendo La Oficina](../blog/2026-05-13-por-que-la-oficina.es.md)** — explica el "por qué" del setup. Este manual es el "cómo."

---

## §1 — Si sos miembro del Frutero Club

El Club siempre fue una comunidad de builders. Lo nuevo es que ahora hay una agencia que **vive de su trabajo y financia su crecimiento**. Eso te abre puertas que antes no existían dentro del mismo espacio.

Concretamente:

- **Podés observar cómo se construye.** Todo el trabajo de La Oficina ocurre en público — código, decisiones, errores. Vas a ver pull requests, journals diarios, y posts sin filtro sobre qué falló y qué funcionó. Aprender de afuera ya es valor.
- **Podés contribuir sin un compromiso pesado.** El skill de La Oficina es open source (AGPL v3). Issues, PRs, ideas para los scripts, mejoras de documentación — todo se acepta y se acredita.
- **Podés sumarte al pipeline de Operators** cuando estés listo (ver §2).
- **Podés traer clientes.** Si tenés un contacto que necesita el tipo de trabajo que hace Frutero Agency, hay una mecánica de referidos. Detalles en proceso.
- **Podés aportar contenido.** Si querés escribir sobre tu propia experiencia construyendo con IA — un post invitado, una entrevista, una charla — el blog del Frutero Club lo aloja.

**Qué no es el Club ahora:** no es una bolsa de trabajo. Si querés un puesto, hay caminos claros (§2) pero no se anuncian roles abiertos en masa.

---

## §2 — Si querés ser Operator en un pod

Un **Operator** es la persona (humana o agente IA) que ejecuta el trabajo del día a día dentro de un pod. Reporta a un Architect humano que es responsable del cliente. El Operator opera dentro de un workstream específico, mantiene su contexto en archivos (STATUS, MEMORY, journal), y entrega outputs concretos contra el SOW del engagement.

### Lo que buscamos en un Operator humano

- Capacidad de pensar como builder — no solo seguir instrucciones sino diagnosticar y proponer.
- Familiaridad con al menos un agent harness (Claude Code, Hermes, Cursor, o equivalente) y comodidad operando con uno como pareja, no como autocompletado.
- Capacidad de escribir documentación útil — entradas de journal densas y específicas, no relleno.
- Inglés técnico funcional (los repos y las herramientas están en inglés; el cliente puede ser ES o EN).
- Disposición para trabajar en público — tu output va a ser parte de la narrativa de Frutero Agency.

### El path

1. **Demostrá ejecución.** Contribuí algo a un repo público de Frutero — un PR al de La Oficina, una entrada de blog invitada, una herramienta útil que compartas con el Club. No hace falta que sea grande; tiene que ser real.
2. **Conversación con un Architect.** No es una entrevista de manual. Es "contame qué construiste y por qué decidiste así." Mostranos cómo pensás.
3. **Trial workstream.** Te asignamos un workstream acotado dentro de un pod existente. Trabajás dos semanas. Al final, evaluamos juntos si vale extender.
4. **Engagement formal.** Si el trial funciona, entrás como Operator en el pod. Compensación atada a outcomes, no a horas.

### Si sos un agent (BYOA)

La Oficina soporta **Bring-Your-Own-Agent**. Si tenés tu propio harness y querés que tu agente opere dentro de un workstream de Frutero, el contrato está en `docs/byoa.md` del repo. Tu agente carga contexto vía `oficina module-load <ruta>`, respeta el scope que declara cada `AGENTS.md`, y contribuye vía PR. No corremos agentes externos directamente sobre nuestra infraestructura — corren sobre la tuya y se comunican vía git.

---

## §3 — Si tu empresa quiere contratar un engagement

Frutero Agency vende **AI Operator Engagements**: un Architect humano + N Operators (humanos o IA) entregando trabajo concreto contra un SOW.

### Qué hacemos bien

- **Sistemas internos potenciados con IA.** Workflows operativos, ETLs, dashboards, asistentes especializados, automatización con LLM in the loop.
- **MVPs y prototipos validables.** Ideales para validar una hipótesis de producto antes de comprometer presupuesto grande.
- **Migraciones y mejoras a sistemas existentes** donde la combinación humano+IA puede acelerar significativamente.
- **Cuando el cliente quiere transferencia de conocimiento al final**, no quedar atado al proveedor.

### Qué evitamos

- Proyectos que requieren un equipo grande de seniors humanos especialistas — no es nuestro modelo.
- Engagements donde no podemos publicar al menos las partes no confidenciales del proceso (build-in-public es parte de cómo crecemos).
- Soporte 24/7 de producción crítica. No es nuestro perfil.
- Engagements sin scope claro. Pedimos workshop de discovery antes de cualquier propuesta.

### Cómo arranca un engagement

1. **Conversación inicial** — 30 a 45 minutos. Entendemos el problema y vos entendés cómo trabajamos.
2. **Discovery pagado** — un sprint corto (1 a 2 semanas) donde mapeamos el alcance, riesgos, y producimos una propuesta técnica concreta. Es trabajo real, se cobra como tal.
3. **SOW + arranque.** Si la propuesta convence, firmamos el SOW y se asigna un pod. El pod se vuelve tu punto de contacto.
4. **Operación.** STATUS semanal mínimo. Acceso al journal del pod si querés transparencia total. Hitos contra entregables concretos del SOW.
5. **Cierre o continuación.** Cada engagement tiene un cierre explícito con transferencia. Si querés extender, se renegocia.

### Pricing principle

No cobramos por hora. Cobramos por outcome — sprints fijos con entregables definidos, o retainers atados a métricas del negocio. Si te están vendiendo horas-hombre, probablemente no somos el proveedor que necesitás.

---

## §4 — Cómo opera un pod-day

Cada pod opera con la misma disciplina. Un día típico (operando vía La Oficina) se ve así:

1. **Open.** El Operator del día (humano o agente) carga el contexto del pod con `oficina module-load pods/<pod>`. Lee la STATUS del workstream activo, el último journal entry, y la MEMORY pertinente.
2. **Pick.** Selecciona la próxima tarea concreta del TICK.md del proyecto. Marca su status como `in_progress`.
3. **Work.** Ejecuta. Si toma decisiones no triviales, las registra en `DECISIONS.md` del workstream con su rationale.
4. **Report.** Al cerrar, actualiza STATUS.md (qué quedó hecho, qué quedó bloqueado, qué sigue), agrega entrada al SESSIONS.md del workstream, y escribe la entrada del journal de pod en `office/journal/YYYY-MM-DD.md` — estilo butter-os: denso, fáctico, sin relleno.
5. **Sync.** Si trabajó en una máquina (local) y va a continuar en otra (servidor), commit y push. La continuidad vive en git, no en la cabeza del Operator.

El **Architect del pod** revisa la salida con cadencia acordada (en general, diariamente para engagements activos). El Architect no opera; supervisa, decide, y firma frente al cliente.

**Lo que nunca cambia:** el journal y el STATUS se escriben. Sin excepción. Saltarse el journal rompe la cadena de continuidad entre sesiones y mata la pipeline de build-in-public. Si no hay journal, no pasó.

---

## §5 — Cómo nos comunicamos

Frutero Agency construye en público. Eso significa que:

- **Cada milestone tiene una pieza de contenido.** No "cuando se pueda" — comprometida por adelantado en el workstream de contenido (`v0.1.0-launch-content` y sus sucesores).
- **Cada pieza pública trazea a un hecho específico.** Una decisión tomada, un script implementado, un pod entregado. Nada de contenido genérico de IA.
- **Cada engagement entregado se vuelve case study** — con permiso del cliente, redactando lo necesario.
- **Cada error público vale la pena se publica.** El primer bug que Dumbleclaw encuentre y resolvamos se documenta. Esconder errores es esconder señal.

### Canales

- **Blog Frutero Club** (frutero.club) — long-form. La fuente canónica.
- **X/Twitter** ([@fruteroclub](https://twitter.com/fruteroclub)) — short-form, threads, marcadores de milestone.
- **LinkedIn** — versión profesional, cross-post curado.
- **Newsletter** (en construcción) — resumen semanal o quincenal de qué se shippeó.

Los detalles operativos (qué se publica, cuándo, en qué canal) viven en `COMMS.md` dentro del workstream de contenido activo.

### Voz

- **Builder-talking-to-builder.** Específica. Concreta. Atribuible.
- **Ejecución sobre especulación. Shipping sobre perfección.**
- **Bilingüe.** ES primario (LATAM-first); EN companion cuando aplica.
- **Evitar:** vocabulario genérico de IA ("delve, robust, comprehensive, multifaceted"), "hacker" como autodefinición externa, frases de founder-cosplay.

---

## §6 — Qué viene en las próximas semanas

A la fecha de este documento (2026-05-13):

- Implementación de los scripts de La Oficina v0.1.0 (`oficina-resolve`, `oficina-add-pod`, `oficina-module-load`, etc.) en el servidor donde corre Dumbleclaw.
- Onboarding del primer pod productivo. Operación de un día completo con Dumbleclaw como Operator. Reporte de resultados.
- Tag v0.1.0 + publicación del repo del skill como artefacto open source navegable.
- Primer case study redactado a partir del primer engagement entregado.
- Apertura de BYOA: primer agente externo (de algún miembro del Club) operando dentro de un workstream Frutero.

Cuando alguno de estos se shippea, sale post. Cuando el cronograma cambia, este manual se actualiza.

---

## Cómo seguirle el hilo

- **Repo open source:** [github.com/fruteroclub/la-oficina](https://github.com/fruteroclub/la-oficina)
- **Blog:** [frutero.club](https://frutero.club)
- **Twitter/X:** [@fruteroclub](https://twitter.com/fruteroclub)
- **Comunidad:** [enlace pendiente]
- **Aplicar a Operator / contactar Agency:** [enlace pendiente]

Si encontraste algo en este manual que está mal, desactualizado, o poco claro: abrí un issue en el repo o mandalo directo. Este manual mejora con la fricción.

> *Ejecución sobre especulación. Shipping sobre perfección.*

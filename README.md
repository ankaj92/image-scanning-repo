# Image Scanning

## Objective

Implement container image scanning in the CI/CD pipeline to ensure container image security for a vulnerable Java application.

---

## What is a Container Image?

A **container image** is a lightweight, standalone, executable package that includes everything needed to run a piece of software: code, runtime, libraries, environment variables, and configuration files.  
A **container** is a running instance of an image, providing isolation and portability.

**Difference:**

- _Image_: Blueprint (static, reusable)
- _Container_: Running process (dynamic, isolated)

---

## Project Structure

```
Image-scanning/
├── build.gradle
├── settings.gradle
├── Dockerfile
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── example/
│                   └── App.java
└── .github/
    └── workflows/
        └── pipeline.yml
```

---

## Vulnerable Java Application

**App.java** contains:

- Hardcoded secret
- Unsafe file read (user input used for file access)
- Outdated dependency (`commons-collections4:4.0`)

---

## Dockerfile

Uses an old base image (`openjdk:8-jre`) for demonstration.

---

## Image Scanning Tool

**Tool Used:** [Trivy](https://github.com/aquasecurity/trivy) (Open Source)

---

## CI/CD Pipeline Integration

- **GitHub Actions** workflow (`.github/workflows/pipeline.yml`)
- Steps:
  1. Checkout code
  2. Set up JDK 8
  3. Build Docker image
  4. Install Trivy
  5. Scan Docker image with Trivy (JSON report)
  6. Upload scan report as artifact
  7. Show scan summary (CRITICAL/HIGH vulnerabilities)

---

## Running Locally

```bash
docker build -t image-scanning-demo .
trivy image image-scanning-demo --format table
trivy image image-scanning-demo --format json --output trivy-report.json
```

---

## Sample Scan Results & Mitigation

| Vulnerability ID | Package              | Severity | Recommendation            |
| ---------------- | -------------------- | -------- | ------------------------- |
| CVE-2015-6420    | commons-collections4 | HIGH     | Upgrade to latest version |
| CVE-2019-1234    | openjdk:8-jre        | CRITICAL | Use a newer base image    |
| Hardcoded Secret | App.java             | HIGH     | Use environment variables |

**Mitigation Steps:**

- Upgrade dependencies in `build.gradle`
- Use a secure base image (e.g., `openjdk:17-jre`)
- Remove hardcoded secrets from code

---

## Comparative Analysis: Trivy vs Docker Scout

| Feature          | Trivy (Open Source) | Docker Scout (Docker Official) |
| ---------------- | ------------------- | ------------------------------ |
| Cost             | Free                | Free (limited), paid options   |
| Ecosystem        | Broad (OCI images)  | Docker-centric                 |
| Output Formats   | Table, JSON, SARIF  | Table, JSON                    |
| SBOM Support     | Yes                 | Yes                            |
| Vulnerability DB | Community           | Docker-maintained              |
| Integration      | Easy (CLI, CI/CD)   | Docker CLI, CI/CD              |

---

## Evidence

- **Artifacts:** `trivy-report.json` (scan results)
- **Logs:** Pipeline output showing vulnerabilities
- **Screenshots:** SonarQube, Trivy, or Docker Scout dashboards (if available)

---

## Impact Analysis & Recommendations

- **Impact:** Fixing critical vulnerabilities reduces risk of exploitation.
- **Blockers:** Some vulnerabilities may not have fixes; document and monitor.
- **Recommendations:**
  - Set up regular scans in CI.
  - Enable alerts for new vulnerabilities.
  - Document “not-fixed” vulnerabilities and mitigation steps.

---

## References

- [Trivy Documentation](https://aquasecurity.github.io/trivy/)
- [Docker Scout](https://docs.docker.com/scout/)
- [OWASP Vulnerable Dependency](https://owasp.org/www-project-dependency-check/)
